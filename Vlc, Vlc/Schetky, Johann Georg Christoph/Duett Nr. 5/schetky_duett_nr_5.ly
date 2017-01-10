\version "2.18.2"
\include "deutsch.ly"
  
#(set-global-staff-size 19.75)

\header {
  title     = \markup \bold \italic "Duett Nr. 5"
  composer  = "Johann Georg Christoph Schetky"
  arranger  = "(1737-1824)"
  enteredby = "cellist (2017-01-10)"
  piece     = "12 Cello Duos, op. 7"
}

voiceconsts = {
  \key a \major
  \clef "bass"
% \numericTimeSignature
  \compressFullBarRests
  % Set default beaming for all staves
%  \set Timing.beamExceptions = #'()
%  \set Timing.baseMoment     = #(ly:make-moment 1 4)
%  \set Timing.beatStructure  = #'(1 1 1)
}

mifl = "flute"
mist = "string ensemble 1"
%minstr = "accordion"
miba = "bassoon"
%miba = "electric bass (pick)"
%miba = "electric bass (finger)"
%milo = "drawbar organ"
milo = "harpsichord"

introa = {        \tempo "1. Allegro "             4=120 \time 4/4 }
introb = { \break \tempo "2. Tempo di Menuet "     4=110 \time 3/4 }

\include "v1.ily"
\include "v2.ily"

music = \new StaffGroup <<
      \new Staff {
	\set Staff.midiInstrument = \mist
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello I" }
	\transpose a a { \va }
      }

      \new Staff {
	\set Staff.midiInstrument = \miba
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello II" }
	\transpose a a { \vb }
      }
>>

\book {
  \score {
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
