.DEFAULT_GOAL := deploy

dc:
	ansible-playbook PLAY_dc_deploy.yml --skip-tags documentation

wan:
	ansible-playbook PLAY_wan_deploy.yml --skip-tags documentation

campus:
	ansible-playbook PLAY_campus_deploy.yml --skip-tags documentation

act:
	ansible-playbook PLAY_act_topology_generator.yml