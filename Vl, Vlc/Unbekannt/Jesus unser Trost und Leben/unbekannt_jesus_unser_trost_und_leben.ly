\version "2.18.2"
\include "deutsch.ly"
  
#(set-global-staff-size 22)

\header {
  title     = \markup \bold \italic "Jesus, unser Trost und Leben"
  composer  = "Unbekannt (1714)"
  arranger  = "arr.: Johann Sebastian Bach (1737)"
  enteredby = "cellist (2020-12-06)"
  piece     = "Schemellis Musicalisches Gesangbuch (1653)"
}

voiceconsts = {
  \key g \minor
  \time 3/4
  \clef "treble"
  \numericTimeSignature
  % Set default beaming for all staves
%  \set Timing.beamExceptions = #'()
%  \set Timing.baseMoment     = #(ly:make-moment 1 4)
%  \set Timing.beatStructure  = #'(1 1 1)
  \tempo "Moderato " 4=100
}

mivl = "violin"
%miba = "pizzicato strings"
miba = "cello"

rit = \mark \markup \box \italic "rit."

\include "v1.ily"
\include "v2.ily"

music = \new StaffGroup <<
      \new Staff {
	\set Staff.midiInstrument = \mivl
	\set Staff.instrumentName = \markup \center-column { "Violine" }
	\transpose g g { \va }
      }

      \new Staff {
	\set Staff.midiInstrument = \miba
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello" }
	\transpose g g { \vb }
      }
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
        \on-the-fly #print-page-number-check-first
        "Unbekannt - Jesus, unser Trost und Leben" \fromproperty #'page:page-number-string
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