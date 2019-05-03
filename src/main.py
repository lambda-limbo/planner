#!/usr/bin/python3

import sys
import getopt
import parser


def main(argv):
    domain = ''
    problem = ''
    output = 'stdout'

    try:
        opts, args = getopt.getopt(argv, "hd:p:o:", ["domain=", "problem=",
                                                     "output="])
    except getopt.GetoptError as error:
        print("%s.\n" % str.capitalize(str(error)))
        usage()
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            usage()
            sys.exit()
        elif opt in ("-d", "--domain"):
            domain = arg
        elif opt in ("-p", "--problem"):
            problem = arg
        elif opt in ("-o", "--output"):
            output = arg

    if(not domain and problem or domain and not problem or not opts):
        print("A domain and a problem is required to execute.\n")
        usage()
        sys.exit()

    print("Solving plan %s for problem %s" % (domain, problem))

    # Calling the parser to parse the files
    d = parser.Problem(domain, problem)
    d.dump()


def usage():
    print("Usage:\n")
    print("\t-h --help\t\t - \tPrints this help")
    print("\t-d --domain <file>\t - \tWhat domain file to use")
    print("\t-p --problem <file>\t - \tWhat problem file to use")
    print("\t-o --output <file>\t - \tDefines where to output the plan, " +
          "default is stdout")


if __name__ == "__main__":
    main(sys.argv[1:])
