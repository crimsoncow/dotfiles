#!/usr/bin/python
import argparse
import os
import re
import sys

C_RESET = '\033[0m'
C_CYAN = '\033[36m'
C_MAGENTA = '\033[35m'

def get_refs(type_, remote=False):
    cmd = 'ls-remote' if remote else 'show-ref'
    full_cmd = '/usr/bin/git {} --{}'.format(cmd, type_)

    regexp = re.compile(r'.*\s+refs\/{}\/(.*)'.format(type_))

    for line in os.popen(full_cmd).read().split('\n'):
        m = regexp.match(line)
        if m and not line.endswith('^{}'):
            yield m.group(1)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-l', '--local-only', action='store_true')
    parser.add_argument('-r', '--remote-only', action='store_true')
    parser.add_argument('-t', '--tags', action='store_true')
    parser.add_argument('-b', '--branches', action='store_true')
    args = parser.parse_args()

    if not args.tags and not args.branches:
        parser.print_help()
        raise Exception('Specify either --tags|-t or --branches|-b')
    if not args.local_only and not args.remote_only:
        parser.print_help()
        raise Exception('Specify either --local-only|-l or --remote-only|-r')

    type_ = 'tags' if args.tags else 'heads'

    remote_refs = set(get_refs(type_, remote=True))
    local_refs = set(get_refs(type_, remote=False))

    if args.local_only:
        result = local_refs - remote_refs
    else:
        result = remote_refs - local_refs

    msg_source = 'Local-only' if args.local_only else 'Remote-only'
    msg_type = 'branches' if args.branches else 'tags'
    msg = '{} {}'.format(msg_source, msg_type)

    print
    print msg
    print '-' * len(msg)
    sys.stdout.write(C_CYAN if args.local_only else C_MAGENTA)
    for ref in sorted(result):
        print ref
    print
    sys.stdout.write(C_RESET)

if __name__ == '__main__':
    main()
