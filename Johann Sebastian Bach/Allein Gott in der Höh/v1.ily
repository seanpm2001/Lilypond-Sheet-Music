va = \relative c'' {
  \voiceconsts
  \clef "treble"

  \partial 4. r4.
  r1.
  \repeat volta 2 {
    R1.*4
    r2. g4.~^\cho g4 a8

    h2. c
    d c
    h a

    g1.
    r
    r2. h

    h a4.~ a4 h8
    c4. h a2.
    g4. e fis2.\prall

    g1.~
  }
  \alternative {
    { g | g4 r8 r4. r2. }
    { r1. }
  }

  R1.*4 r2. g
}