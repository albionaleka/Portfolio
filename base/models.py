from django.db import models

# Create your models here.
class Contact(models.Model):
    name= models.CharField(max_length=40)
    email=models.EmailField(max_length=40)
    number=models.CharField(max_length=20)
    message=models.TextField(max_length=400)

    def __str__(self):
        return(self.name)


class Projects(models.Model):
    name = models.CharField(max_length=40)
    image = models.FileField(blank=True, null=True, upload_to='img/')
    desc = models.CharField(max_length=400)
    link = models.URLField(blank=True, null=True)

    class Meta:
        verbose_name_plural = 'Projects'
        verbose_name = 'Project'

    def __str__(self):
        return self.name
    

class Certificates(models.Model):
    name = models.CharField(max_length=40)
    image = models.FileField(blank=True, null=True, upload_to='img/')
    institute = models.CharField(blank=True, null=True, max_length=40)
    url = models.URLField(blank=True, null=True)
    date = models.DateField(blank=True, null=True)

    class Meta:
        verbose_name_plural = 'Certificates'
        verbose_name = 'Certificate'

    def __str__(self):
        return self.name
