import subprocess
import sys


def main():
    version = sys.argv[1]
    branch = "rel_" + version
    containers = [
        "manylinux_2_24_x86_64",
        "manylinux_2_24_i686",
        "manylinux_2_24_aarch64",
        "manylinux_2_24_ppc64le",
        "manylinux_2_24_s390x",
        "manylinux2014_x86_64",
        "manylinux2014_i686",
        "manylinux2014_aarch64",
        "manylinux2014_ppc64le",
        "manylinux2014_s390x",
        "manylinux2010_x86_64",
        "manylinux2010_i686",
        "manylinux1_x86_64",
        "manylinux1_i686",
    ]
    files_to_edit = ["./Dockerfile"]

    # Setup Git
    subprocess.call(["git", "config", "--global", "user.email", '"ralfg@hotmail.be"'])
    subprocess.call(["git", "config", "--global", "user.name", '"Ralf Gabriels"'])

    # Checkout new branch
    subprocess.call(["git", "checkout", "-b", branch])

    # Replace, add, commit, tag
    for i, container in enumerate(containers):
        if i > 0:
            for file_ in files_to_edit:
                subprocess.call(
                    [
                        "sed",
                        "-i",
                        "-e",
                        f"s/{containers[i-1]}/{containers[i]}/g",
                        file_,
                    ]
                )
        subprocess.call(["git", "add"] + files_to_edit)
        subprocess.call(["git", "commit", "-m", f'Change container to {container}'])
        subprocess.call(["git", "tag", version + "-" + container])

    # Push
    subprocess.call(["git", "push", "--set-upstream", "origin", branch])
    subprocess.call(["git", "push", "--tags"])


if __name__ == "__main__":
    main()
