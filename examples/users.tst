{% set users = salt['pillar.get']('users', []) %}

check_user_accounts:
  module_and_function: user.info
  args:
    - name: root
  assertions:
    - assertNotEmpty: return

{% for user in users %}
check_{{ user.name }}:
  module_and_function: user.info
  args:
    - name: {{ user.name }}
  assertions:
    - assertEqual:
        - return.shell
        - {{ user.shell | default('/bin/bash') }}
{% endfor %}
