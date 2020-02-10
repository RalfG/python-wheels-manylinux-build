import sys
import subprocess


def main():
    version = sys.argv[1]
    containers = [
        "manylinux1_x86_64",
        "manylinux2014_x86_64",
    ]
    action_file = "action.yml"

    # Checkout new branch
    subprocess.call(["git", "checkout", "-b", version])

    # Replace, add, commit, tag
    for i, container in enumerate(containers[1:]):
        subprocess.call(
            ["sed", "-i", "-e", f"s/{containers[i-1]}/{container}/g", action_file]
        )
        subprocess.call(["git", "add", action_file])
        subprocess.call(["git", "commit"])
        subprocess.call(["git", "tag", version + "_" + container])

    # Push
    subprocess.call(["git", "push"])
    subprocess.call(["git", "push", "--tags"])


if __name__ == "__main__":
    main()
