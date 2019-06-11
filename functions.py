#! /usr/bin/python3

import json
import subprocess

# returns a dictionary of the environment variables resulting from sourcing a file
def env_from_sourcing(file_to_source_path, include_unexported_variables=False):
    source = '%ssource %s' % ("set -a && " if include_unexported_variables else "", file_to_source_path)
    dump = '/usr/bin/python -c "import os, json; print json.dumps(dict(os.environ))"'
    pipe = subprocess.Popen(['/bin/bash', '-c', '%s && %s' % (source, dump)], stdout=subprocess.PIPE)
    return json.loads(pipe.stdout.read())



