# tutorial-cecam-workshop-dftk-2025


## Installation setup

What you need to work with this material:

- Julia [1.12](https://www.julialang.org/downloads/). The recommended way is to [use the `juliaup` installer](https://github.com/JuliaLang/juliaup):

  **Unix (Linux / Mac)**: Run in you terminal:
  ```bash
  curl -fsSL https://install.julialang.org | sh
  ```
  On **Windows** Julia and Juliaup can be installed directly from the Windows store [here](https://apps.microsoft.com/detail/9njnww8pvkmn).

- [IJulia.jl](https://github.com/JuliaLang/IJulia.jl). The following command will install IJulia, and also install a kernel specification to [Jupyter](https://jupyter.org/install) that allows Julia to be selected as language in Jupyter notebooks.
  ```bash
  julia -e 'import Pkg; Pkg.add("IJulia")'
  ```
- All required dependencies (Julia packages) for the workshop. You can install these by running the following command at the top-level of this repository:
  ```bash
  julia --project -e 'import Pkg; Pkg.instantiate()'  # Can take 5-10 minutes to install everything
  ```

## Running the notebooks

If you already have jupyter installed, you can directly open and execute the notebooks.

Alternatively, you can have IJulia install its own minimal Python+Jupyter distribution upon calling:
```bash
julia -e 'import IJulia; jupyterlab(dir=pwd())'
```


