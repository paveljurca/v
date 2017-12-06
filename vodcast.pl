#!perl
use strict;
use warnings;
use open qw(:std :utf8);
use autodie qw(:all);
use utf8;

use File::Basename;
use File::Spec::Functions;

print<<'EOL';
********************
VODCAST
(c) 2017 VŠE v Praze

https://mediasite.vse.cz
********************

EOL

#========= MAIN ===========

# base dir
my $root = catdir(dirname($0), 'lib');

v();

#==========================

sub v {
    # setup
    my $p2g_dir = file_dialog(catfile($root, 'FileDialog.vbs'));

  my $mediasite = {
  root    => $path,
  vodcast => $path.q(\_VODCAST\\),
  content => $path.q(\Content\\),
  };

  ####

  info("nacitam META data");


  ####

  info("parsuji XML");

  ####
  my @xml = xml();

  #@todo: has a bad code page
  #my ($title) = (shift @xml) =~ m|Title>([^<]+)<|;
  #cut the illegal chars in a file name
  #$title =~ s![-_:;.,*?"'|<>/\\; ]+!_!g;

  #title as the dir name
  my $title = (split /\\/, $mediasite->{root})[-1];


  my $slides;
  for (@xml) {


    my ($milisec) = m|Time>(\d+)<|;



    #push @slides, $milisec;
  }

  #print $&, grep /Time>(\d+)</, @xml;
  /Time>(\d+)</ and print $1 for @xml;
  error("hokus");
}

sub file_dialog {
  my $vbs = shift;
  chomp(my $path = qx(cscript.exe $vbs //E:VBScript //Nologo));

  return $path;
}



####

sub xml {

#my ($xml) = grep(
#  /MediasitePresentation_\d{2}\.xml$/i,
#  bsd_glob(qq($import/*), File::Glob::GLOB_ERR | File::Glob::GLOB_NOSORT)
#);

  open(my $in, "<:utf8",
  $mediasite->{root}.q(\MediasitePresentation_60.xml)
  ) or error("spatny export");

  my @xml = split m|<Slide>|, join "", <$in>;

  close $in;

  return @xml;
}


info("nacitam zdrojova data");

####

opendir my $dh, $mediasite->{content}
  or error("chybna mediasite slozka");

# source media files
my @files = readdir $dh;

closedir $dh;

#my @slides = map {

#   each     [ nazev, duration ]

#} sort grep /full\.jpg$/, @files;


####

info("vytvarim audio stopu");

####

my ($video) = grep /mp4$/i, @files;
error("zadny mp4 soubor prednasky") unless $video;

# generuj audio
my $audio = $title.".mp3";

#qw(-v warning -progress /dev/stdout)
system("bin/ffmpeg/ffmpeg.exe", "-i",
 $mediasite->{content}.$video,
 $mediasite->{vodcast}.$audio,

 # -q:a 9 # bitrate

) and error("neplatny nazev souboru");




####

info("vytvarim VODCAST");

####

sub ffmpeg {
  mkdir $mediasite->{vodcast}
    or die unless -e $mediasite->{vodcast};

  open my $ffconcat, ">:utf8", undef or die;
  
  print $ffconcat "ffconcat version 1.0\n"
  print $ffconcat qq(file '$slide'\nduration $duration_milisec\n) for @slides;
  
  close $ffconcat;

  # system 'ffmpeg.exe', '-i', $ffconcat '-i', $audio, qw(-safe 0 -c:a copy -shortest -vf fps=5), 'vodcast.mp4';

}

sub info {
  print "\n(i) ", shift, "...\n\n";
}

sub error {
  print "\n(err) ", shift, "\n\n";
  exit 2;
}
