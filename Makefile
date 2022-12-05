.DEFAULT_GOAL := deploy

dc:
	ansible-playbook PLAY_dc_deploy.yml --skip-tags documentation

wan:
	ansible-playbook PLAY_wan_deploy_eapi.yml --skip-tags documentation

checkwan:
	ansible-playbook PLAY_wan_deploy_eapi.yml --tags deploy --check --diff

campus:
	ansible-playbook PLAY_campus_deploy.yml --skip-tags documentation

act:
	ansible-playbook PLAY_act_topology_generator.yml

