{% set service_name = 'nginx' %}
{% set config = salt['pillar.get']('nginx:config', 'nginx/nginx.conf') %}

include:
  - nginx.package

{{ service_name }}-config:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://{{ config }}
    - user: root
    - group: root
    - mode: '0644'
    - require:
      - pkg: {{ service_name }}
    - watch_in:
      - service: {{ service_name }}

{{ service_name }}:
  service.running:
    - enable: True
    - require:
      - pkg: {{ service_name }}
