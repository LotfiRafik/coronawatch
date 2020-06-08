from django.core.management.base import BaseCommand, CommandError
from robots.robot_youtube import running



class Command(BaseCommand):
    """
        Script to collect data from youtube,
        execute python manage.py script
        
    """

    def handle(self, *args, **options):
        running()