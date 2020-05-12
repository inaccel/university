c = get_config()

c.JupyterHub.hub_ip = 'jupyterhub'
c.JupyterHub.hub_port = 8080

c.JupyterHub.admin_access = True
c.JupyterHub.active_server_limit = 9

c.Spawner.default_url = '/lab/'

c.Authenticator.admin_users = set('admin')
c.Authenticator.whitelist = {'parml01', 'parml02', 'parml03', 'parml04', 'parml05', 'parml06', 'parml07', 'parml08', 'admin'}
