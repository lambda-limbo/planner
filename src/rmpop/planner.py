import subprocess


class Planner():
    """
    The planner class represents the partial order planning that solves planning
    problems.
    """

    def solve(domain, problem, output='stdout'):
        """
        This method calls the planner that actually solves the problem and
        returns the data to the called.
        """
        program = "../bin/pop-planner"
        # List of commands
        l = [program, '--domain', domain, '--problem', problem]

        if(output != 'stdout'):
            l.append('--output')
            l.append(output)

        result = subprocess.run(l, stdout=subprocess.PIPE)

        return result.stdout.decode('utf-8')
