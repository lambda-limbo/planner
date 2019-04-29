import sys

def main():
    arguments = sys.argv

    if len(arguments) == 1:
        usage()
        exit(0)

    for a in arguments[1:]:
        if a == "--help" or a == "-h":
            usage()
            break
        elif a == "-d":
            break
        else:
            print("Command \"%s\" was not recognized.\n" % a)
            usage()

def usage():
    print("Usage:\n")
    print("\t-h --help\t\t - \tPrints this help")
    print("\t-d --domain <file>\t - \tWhat domain file to use")
    print("\t-p --problem <file>\t - \tWhat problem file to use")
    print("\t-o --output <file>\t - \tDefines where to output the plan, " +
          "default is stdout")


if __name__ == "__main__":
    main()
