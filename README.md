# IEEE A-SSCC (Asian Solid-State Circuits Conference) 2026 LaTeX Template

This repository contains a LaTeX class and sample document based on the provided IEEE A-SSCC 2026 Word/PDF on the official website — unofficial, of course; no matter how faithfully it mimics the official template, it still doesn’t come with an official stamp!

## Files

- `asscc2026.cls`: conference layout class
- `IEEEtran.cls`, `IEEEtran.bst`: IEEE base class and bibliography style
- `template.tex`: blank starting point
- `sample.tex`: sample manuscript matching the provided template structure
- `Makefile`: build helper

## Build

```sh
make pdf
```

Build the blank template with:

```sh
make SRC=template pdf
```

Build your own paper with:

```sh
make SRC=texfile_name pdf
```

The class uses XeLaTeX by default so that the system Arial font can be used when available. With pdfLaTeX, it falls back to the available sans-serif font setup.

## Authors And Affiliations

Use `\authorrefmark` in the author list and one or more `\address` commands for affiliations:

```tex
\author{Author One\authorrefmark{1}, Author Two\authorrefmark{2}}
\address[1]{Department, University, City, Country}
\address[2]{Company or Institute, City, Country}
```

## References

Manual references work with the standard LaTeX `thebibliography` environment:

```tex
\begin{thebibliography}{9}
\bibitem{ref1}
Author et al., ``Paper title,'' Conference or Journal, pp. 1--4, 2026.
\end{thebibliography}
```

For BibTeX, use the included IEEE style:

```tex
\bibliographystyle{IEEEtran}
\bibliography{references}
```

## Figure Pages

The source template reserves pages 2 and 3 for bordered figure slots. Use `\ASSCCFigurePage` with six cells.

```tex
\ASSCCFigurePlaceholder[\vfill
  \includegraphics[width=0.95\linewidth,height=2.7in,keepaspectratio]{figure-file} \vfill
]{Fig. 1. Caption text.}
```

For more control, use `\ASSCCFigureSlot{figure content}{caption text}`.
