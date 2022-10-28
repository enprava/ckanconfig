#!/bin/bash
cd /usr/lib/ckan/venv/src
/usr/lib/ckan/venv/bin/pip install -e git+https://github.com/davidread/ckanext-hierarchy.git#egg=ckanext-hierarchy
usr/lib/ckan/venv/bin/pip install -r ckanext-hierarchy/requirements.txt
cd /etc/ckan

export CKAN_PLUGINS="stats text_view image_view recline_view datastore datapusher hierarchy_display hierarchy_form webpage_view"
export CKAN_VIEWS="image_view text_view recline_view webpage_view"
export DATAPUSHER_FORMATS="csv xls xlsx tsv application/csv application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
export CKAN_DEFAULT=es

ckan config-tool "/etc/ckan/production.ini" "ckan.plugins = ${CKAN_PLUGINS}"
ckan config-tool "/etc/ckan/production.ini" "ckan.datapusher.formats = ${DATAPUSHER_FORMATS}"
ckan config-tool "/etc/ckan/production.ini" "ckan.locale_default = ${CKAN_DEFAULT}"
ckan config-tool "/etc/ckan/production.ini" "ckan.views.default_views = ${CKAN_VIEWS}"
