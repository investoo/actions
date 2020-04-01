import json
import sys
from pkg_resources import parse_version

master_package_json = sys.argv[1]

master_version = json.loads(master_package_json)['version']
new_version = json.load(open('package.json'))['version']

if parse_version(new_version) <= parse_version(master_version):
  print('Version {} must be greater than current version {}'.format(new_version, master_version))
  exit(1)
else:
  print('All good. Version {} is greater than current version {}'.format(new_version, master_version))
  exit(0)