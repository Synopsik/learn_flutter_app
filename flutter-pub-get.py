import os
import subprocess


def get_dirs() -> list[str]:
    """
    Generates a list of directory paths matching the specified criteria within a file 
    system hierarchy starting at the current working directory.

    The function scans the directory structure recursively using `os.walk`, searching for 
    directories named "candy_store" that are not nested within another directory named 
    "candy_store". Matching directory paths are appended to the resulting list and returned.

    :return: A list of directory paths matching the specified criteria.
    :rtype: list[str]
    """
    
    file_tree = []
    for root, dirs, files in os.walk(".", topdown=True):
        for name in dirs:
            # If we are in the project root and not a cached location
            if name == "candy_store" and root.find("candy_store") < 0:
                file_tree.append(os.path.join(root, name)) # store path string 
    return file_tree


def update_packages(file_tree: list[str]):
    """
    Updates packages for each project directory provided in the file tree.

    This function iterates through a given list of project directories, navigates 
    to each project directory, and runs the "flutter pub get" command to update 
    the packages for the Flutter projects. After processing each project directory, 
    it changes back to the original working directory.

    :param file_tree: A list of project directory paths to process. Each path 
        should represent a valid directory containing a Flutter project.
    :type file_tree: list[str]
    :return: None
    """
    # Set to your flutter.bat location
    flutter_path = f"{os.path.expanduser("~")}\\dev\\flutter\\bin\\flutter.bat" 
    home_dir = os.getcwd()
    for proj_dir in file_tree:
        os.chdir(proj_dir) # Change directory to project directory
        subprocess.run( # First parameter in run() should point to flutter.bat location
            [flutter_path, "pub", "get"])
        os.chdir(home_dir) # Change directory back to the initial location


def main():
    update_packages(get_dirs())

          
if __name__ == "__main__":
    main()