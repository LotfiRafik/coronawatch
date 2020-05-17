from rest_framework import serializers

from .models import Countries, Regions, infectedRegions, receptionCenter


class CountrySerializer(serializers.ModelSerializer):
    class Meta:
        model = Countries
        fields = '__all__'

class RegionSerializer(serializers.ModelSerializer):

    class Meta:
        model = Regions
        fields = '__all__'



class RegionCountrySerializer(serializers.ModelSerializer):

    country_detail = serializers.SerializerMethodField()

    class Meta:
        model = Regions
        fields = '__all__'
        extra_kwargs = {
            'country': {'write_only': True},
        }

    def get_country_detail(self, instance):
        country = Countries.objects.get(id=instance.country.id)
        return CountrySerializer(country).data



class DetailCountrySerializer(serializers.ModelSerializer):
    
    regions = serializers.SerializerMethodField()
    class Meta:
        model = Countries
        fields = '__all__'

    def get_regions(self, instance):
        regions = Regions.objects.filter(country=instance).order_by('region_name')
        return RegionSerializer(regions,many=True).data




class infectedRegionSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = infectedRegions
        exclude = ['moderatorid']

class detailInfectSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = infectedRegions
        exclude = ['id','valide','moderatorid','regionid']
        

class HistoryInfectedRegionSerializer(serializers.ModelSerializer):
    
    history = serializers.SerializerMethodField()
    country_detail = serializers.SerializerMethodField()

    class Meta:
        model = Regions
        exclude = ['riskvalide','riskmoderatorid','country']

    def get_history(self, instance):
        if self.context['request'].user.is_authenticated and self.context['request'].user.user_type == 1:
            #only the moderator who can see all infected regions even not valide
            regions = infectedRegions.objects.filter(regionid=instance).order_by('-date')
        else:
            regions = infectedRegions.objects.filter(regionid=instance,valide=True).order_by('-date')

        return detailInfectSerializer(regions, many=True).data
 
    def get_country_detail(self, instance):
        country = Countries.objects.get(id=instance.country.id)
        return CountrySerializer(country).data



class TotalStatsSerializer(serializers.Serializer):
    nb_death__sum = serializers.IntegerField(read_only=True)
    nb_recovered__sum = serializers.IntegerField(read_only=True)
    nb_notyetsick__sum = serializers.IntegerField(read_only=True)
    nb_suspected__sum = serializers.IntegerField(read_only=True)
    nb_confirmed__sum = serializers.IntegerField(read_only=True)
