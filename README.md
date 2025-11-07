# tutorial-cecam-workshop-dftk-2025


## Installation setup

What you need to work with this material:

- Julia [1.12](https://www.julialang.org/downloads/)
  - The recommended way is to [use the `juliaup` installer](https://github.com/JuliaLang/juliaup)
- [Jupyter](https://jupyter.org/install)
- [IJulia.jl](https://github.com/JuliaLang/IJulia.jl). The following command will install IJulia, and also install a kernel specification to Jupyter that allows Julia to be selected as language in Jupyter notebooks.

```
julia -e 'import Pkg; Pkg.add("IJulia")'
```
- All required dependencies (Julia packages) for the workshop. You can install these by running the following command in this repository:
```
julia --project -e "import Pkg; Pkg.instantiate()"
```
