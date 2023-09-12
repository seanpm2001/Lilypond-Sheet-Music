\version "2.24.1"
\include "deutsch.ly"

#(set-global-staff-size 22)

\header {
  title       = \markup \bold \italic "\"This Little Light of Mine\""
  composer    = "Spiritual"
  arranger    = "arr.: Harry Dixon Loes (1892-1965)"
  enteredby   = "cellist (2023-09-12)"
  piece       = \markup \center-column \italic {
    "\"This little light of mine"
    "I'm gonna let it shine\""
  }
}

voiceconsts = {
  \key f \major
  \time 4/4
  \numericTimeSignature
  \compressEmptyMeasures
  % Set default beaming for all staves
%  \set Timing.beamExceptions = #'()
%  \set Timing.baseMoment     = #(ly:make-moment 1 4)
%  \set Timing.beatStructure  = #'(1 1 1)
  \tempo "Allegretto " 4=160
}

mikl = "bright acoustic"
% mikl = "church organ"

atem = \mark \markup \box \italic "a tempo"
dcaf = \mark \markup \box \italic "D.C. al Fine"
fine = \mark \markup \box \italic "Fine"
rit  = \mark \markup \box \italic "rit."

\include "v1.ily"
\include "v2.ily"

music = \new PianoStaff <<
  \set PianoStaff.midiInstrument = \mikl
  \set PianoStaff.instrumentName = \markup \center-column { "Klavier" }
  <<
    \new Staff {
      \transpose f f { \va }
    }
%    \new Dynamics \vdy
    \new Staff {
      \transpose f f { \vb }
    }
  >>  
>>

\book {
   \paper {
    print-page-number = ##t
    print-first-page-number = ##t
    ragged-last-bottom = ##f
    oddHeaderMarkup = \markup \null
    evenHeaderMarkup = \markup \null
    oddFooterMarkup = \markup {
      \fill-line {
        \if \should-print-page-number
        "Spiritual - \"This Little Light of Mine\"" \fromproperty #'page:page-number-string
      }
    }
    evenFooterMarkup = \oddFooterMarkup
  } \score {
    \music
    \layout {}
  }

  \score {
    \unfoldRepeats \music

    \midi {
      \context {
        \Score
      }
    }
  }
}
