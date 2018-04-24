"""
Django settings for excelweb project.
Generated by 'django-admin startproject' using Django 1.9.4.
For more information on this file, see
https://docs.djangoproject.com/en/1.9/topics/settings/
For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.9/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.9/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '=zn8e^-gw3lu$=9r@_t1a!+tw#*pmy7ctp&+gft+5zx@gqdk98'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'core',
    'social_django',
    'dashboard',
    'candidato',
    'cep',
    'elections',
]

MIDDLEWARE_CLASSES = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',

    'social_django.middleware.SocialAuthExceptionMiddleware',
]

ROOT_URLCONF = 'core.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',

                'social_django.context_processors.backends',  # <--
                'social_django.context_processors.login_redirect',  # <--
            ],
        },
    },
]

WSGI_APPLICATION = 'core.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.9/ref/settings/#databases

if os.environ.get('USER', '') == 'ubuntu':
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'pdc',
            'USER': 'paulrsilva',
            'PASSWORD': '12341312iggb',
            'HOST': 'pdc.clpcb1dffjfg.us-east-2.rds.amazonaws.com',   # Or an IP Address that your DB is hosted on
            'PORT': '3306',
        }
    }
    DEBUG = False
else:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'pdc',
            'USER': 'root',
            'PASSWORD': '',
            'HOST': '127.0.0.1',   # Or an IP Address that your DB is hosted on
            'PORT': '3306',
        }
    }


# Password validation
# https://docs.djangoproject.com/en/1.9/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

AUTHENTICATION_BACKENDS = (
    'social_core.backends.github.GithubOAuth2',
    'social_core.backends.twitter.TwitterOAuth',
    'social_core.backends.facebook.FacebookOAuth2',

    'django.contrib.auth.backends.ModelBackend',
)

# session configuration for token expiration
SESSION_COOKIE_AGE = 60 * 60 * 24 * 7 * 2   # 2 weeks in seconds
SESSION_SAVE_EVERY_REQUEST = True
CSRF_COOKIE_NAME = 'XSRF-TOKEN'

# Internationalization
# https://docs.djangoproject.com/en/1.9/topics/i18n/

LANGUAGE_CODE = 'pt-br'

# TIME_ZONE = 'UTC'
TIME_ZONE = 'America/Sao_Paulo'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.9/howto/static-files/
STATIC_ROOT = os.path.join(BASE_DIR, 'assets/')

STATIC_URL = '/static/'

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
)

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static/'),
)

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/var/www/example.com/media/"
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash.
# Examples: "http://example.com/media/", "http://media.example.com/"
MEDIA_URL = '/media/'

LOGIN_URL = 'login'
LOGIN_REDIRECT_URL = 'home'
LOGOUT_URL = 'logout'

# Social Authentication Paul
SOCIAL_AUTH_FACEBOOK_KEY = '555229794846219'  # App ID
SOCIAL_AUTH_FACEBOOK_SECRET = '06a7fbeab80f5c3ab99dbc4d1797a5ce'  # App Secret

# Social Authentication from someone
# SOCIAL_AUTH_FACEBOOK_KEY = '1464725153656586'  # App ID
# SOCIAL_AUTH_FACEBOOK_SECRET = 'b66a8fd11e1d435cf53d0074e6379508'  # App Secret

# Please use the company smtp to send emails
DEFAULT_FROM_EMAIL = 'scopo@scopoonline.com'
EMAIL_USE_TLS = True
EMAIL_HOST = 'smtpi.uni5.net'
EMAIL_HOST_USER = 'scopo@scopoonline.com'
EMAIL_HOST_PASSWORD = 'Scopo@2018'
EMAIL_PORT = 587
