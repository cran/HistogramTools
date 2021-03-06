\name{NEWS}
\title{News for Package \pkg{HistogramTools}}
\newcommand{\cpkg}{\href{http://CRAN.R-project.org/package=#1}{\pkg{#1}}}

\section{Changes in HistogramTools version 0.3.1 (2014-08-26)}{
  \itemize{
    \item Add Copyright and Authors@R fields to DESCRIPTION.
    \item Add fully qualified reference to gdata function to silence
  CHECK warnings.
  }
}
\section{Changes in HistogramTools version 0.3 (2013-12-11)}{
  \itemize{
    \item Moved 'Hmisc' from Depends to Imports.
    \item Improved introduction vignette significantly.
    \item Added \code{ScaleHistograms} function.
    \item Added \code{PlotRelativeFrequency} function to plot relative
    frequency histograms.
    \item Added \code{minkowski.dist}, \code{intersect.dist},
      \code{kl.divergence}, \code{jeffrey.divergence} measures for two
      histograms.
    \item Added \code{PreBinnedHistogram} for creating histogram objects
     from an already binned dataset (e.g. just a vector of bins and counts).
  }
}
\section{Changes in HistogramTools version 0.2 (2013-10-02)}{
  \itemize{
    \item Moved 'RProtoBuf' from Suggests to Enhances and made all uses
     conditional so that this package can be built and checked without
     it.
     \item Improved plot titles for PlotKSDCC and PlotEMDCC.
     \item Added a quick reference vignette.
     \item Implemented support for smoothing out a histogram with
     Average Shifted Histograms from the ash package.
     \item Added \code{PlotLog2ByteEcdf} and
       \code{PlotLogTimeDurationEcdf} function for creating better
       looking Ecdfs of data binned on power of 2 byte boundaries and
       log-scale time duration boundaries.
     \item Remove unused methods dependency and tighten up what we
       import and export in the NAMESPACE file.
  }
}
\section{Changes in HistogramTools version 0.1 (2013-09-13)}{
  \itemize{
    \item Initial CRAN release
  }
}
