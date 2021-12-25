vc = \relative c {
  \voiceconsts
  \clef "bass"
  
  \partial 4 c4
  f f f f
  g8( a) f( g) e4 a,
  b g c c
  f f,2 \breathe c'4

  a'4. b8 a4 a
  c2 c4 a
  a8( g) b( g) f4 e
  f8( e) f( g) a4 \breathe c,

  c4. d8 c4 c
  e8( f) d( e) c4 c'
  c8( b) d( b) a4 g
  a8( g) a( b) c4 \breathe c,
  
  \repeat volta 2 {
    f f f f
    g8( a) f( g) e4 a,
    b g c c
    f f,2 \breathe c'4

    a'4. b8 a4 a
    c2 c4 a
    a8( g) b( g) f4 e
    f8( e) f( g) a4 \breathe c,

    c4. d8 c4 c
    e8( f) d( e) c4 c'
    c8( b) d( b) a4 g
    a8( g) a( b) c4 \breathe c,
  }
  f f f\fermata \bar "|."
}