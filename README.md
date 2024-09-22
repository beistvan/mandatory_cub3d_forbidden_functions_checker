# cub3D Forbidden Functions Checker

cub3D forbidden functions checker for the mandatory part of the cub3d project.

## Run
[`./mandatory_cub3d_forbidden_functions_checker.sh`]()

## Download and Run the Bash Script

This script checks for forbidden functions in the cub3D project.

### Steps to Download and Run

1. **Download the script using `curl`:**

    ```sh
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/beistvan/mandatory_cub3d_forbidden_functions_checker/main/mandatory_cub3d_forbidden_functions_checker.sh)"
    ```

2. **Make the script executable:**

    ```sh
    chmod +x mandatory_cub3d_forbidden_functions_checker.sh
    ```

3. **Run the script:**

    ```sh
    ./mandatory_cub3d_forbidden_functions_checker.sh
    ```

### Example Output

#### No forbidden functions detected
```sh
Forbidden functions checker for mandatory cub3D
✅ OK: No forbidden functions found. ✅
```

#### Forbidden functions detected
```sh
Forbidden functions checker for mandatory cub3D
❌ Forbidden functions detected ❌:
abs
memcpy
memset
system
```
