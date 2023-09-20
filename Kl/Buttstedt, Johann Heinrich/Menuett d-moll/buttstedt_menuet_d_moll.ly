\version "2.24.1"
\include "deutsch.ly"

#(set-global-staff-size 19)

\header {
  title       = \markup \bold \italic "Menuett in d-moll"
  composer    = "Johann Heinrich Buttstedt (1666-1727)"
  arranger    = "arr.: Klaus Heidtmann"
  enteredby   = "cellist (2023-09-19)"
  piece       = \markup \center-column {
    "\"Musicalische Clavierkunst und Vorrathskammer\","
    "Nr. 5, 4. Satz"
  }
}

voiceconsts = {
  \key d \minor
  \time 3/4
%  \numericTimeSignature
  \compressEmptyMeasures
  % Set default beaming for all staves
%  \set Timing.beamExceptions = #'()
%  \set Timing.baseMoment     = #(ly:make-moment 1 4)
%  \set Timing.beatStructure  = #'(1 1 1)
  \tempo "Andante con moto " 4=90
}

% mikl = "harpsichord"
mikl = "bright acoustic"
% mikl = "church organ"
% mikl = "reed organ"

atem = \mark \markup \box \italic "a tempo"
dcaf = \mark \markup \box \italic "D.C. al Fine"
fine = \mark \markup \box \italic "Fine"
pora = \mark \markup \box \italic "poco rall."
rit  = \mark \markup \box \italic "rit."
mfmp = \markup { \dynamic mf "/" \dynamic mp }

\include "v1.ily"
\include "v2.ily"

music = \new PianoStaff <<
  \set PianoStaff.midiInstrument = \mikl
  \set PianoStaff.instrumentName = \markup \center-column { "Klavier" }
  <<
    \new Staff {
      \transpose d d { \va }
    }
%    \new Dynamics \vdy
    \new Staff {
      \transpose d d { \vb }
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
        "Johann Heinrich Buttstedt - Menuett in d-moll" \fromproperty #'page:page-number-string
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
