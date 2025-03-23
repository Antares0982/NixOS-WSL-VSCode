import os
import subprocess
import sys


def is_elf_file(filepath):
    try:
        with open(filepath, 'rb') as f:
            header = f.read(4)
            return header == b'\x7fELF'
    except Exception:
        return False


def find_elf_files(directory):
    ret = []
    for root, dirs, files in os.walk(directory):
        for file in files:
            full_path = os.path.join(root, file)
            if is_elf_file(full_path):
                print(full_path)
                ret.append(full_path)
    return ret


if __name__ == "__main__":
    for val in find_elf_files(sys.argv[1]):
        subprocess.run(["patchelf", "--set-interpreter", os.environ["_NIX_INTERPRETER"], "--set-rpath", os.environ["_NIX_RPATH"], val], check=False)
