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



class DetailCountrySerializer(serializers.ModelSerializer):
    
    regions = RegionSerializer(many=True, read_only=True)
    class Meta:
        model = Countries
        fields = '__all__'



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

    class Meta:
        model = Regions
        exclude = ['riskvalide','riskmoderatorid']

    def get_history(self, instance):
        regions = infectedRegions.objects.filter(regionid=instance).order_by('-date')
        return detailInfectSerializer(regions, many=True).data