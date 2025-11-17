# tutorial-cecam-workshop-dftk-2025


## Installation setup

What you need to work with this material:

- Julia [1.12](https://www.julialang.org/downloads/). The recommended way is to [use the `juliaup` installer](https://github.com/JuliaLang/juliaup):
  ```bash
  curl -fsSL https://install.julialang.org | sh
  ```
- [IJulia.jl](https://github.com/JuliaLang/IJulia.jl). The following command will install IJulia, and also install a kernel specification to [Jupyter](https://jupyter.org/install) that allows Julia to be selected as language in Jupyter notebooks.
  ```bash
  julia -e 'import Pkg; Pkg.add("IJulia")'
  ```
- All required dependencies (Julia packages) for the workshop. You can install these by running the following command at the top-level of this repository:
  ```bash
  julia --project -e 'import Pkg; Pkg.instantiate()'
  ```

## Running the notebooks
Now you can open the notebook environment by:
```bash
julia -e 'import IJulia; jupyterlab(dir=pwd())'
```


