import os
import shutil

src_dir = r"C:\Users\ThayVuongNTK\Documents\GitHub\vatli12kntt"
dest_dir = r"d:\OneDrive\Web bai giang"

print("Syncing files from Git repo to OneDrive workspace...")

def copy_overwrite_dir(src, dest):
    if not os.path.exists(dest):
        os.makedirs(dest)
    for root, dirs, files in os.walk(src):
        rel = os.path.relpath(root, src)
        dest_root = os.path.join(dest, rel)
        if not os.path.exists(dest_root):
            os.makedirs(dest_root)
        for f in files:
            sf = os.path.join(root, f)
            df = os.path.join(dest_root, f)
            try:
                shutil.copy2(sf, df)
            except Exception as e:
                print(f"Failed to copy {sf} to {df}: {e}")

src_src = os.path.join(src_dir, "src")
dest_src = os.path.join(dest_dir, "src")

copy_overwrite_dir(src_src, dest_src)
print("Synced src directory.")

# Sync python files
for f in ["parse_physics.py", "compile_tikz.py"]:
    shutil.copy2(os.path.join(src_dir, f), os.path.join(dest_dir, f))
    print(f"Synced {f}")

print("Sync completed successfully!")
