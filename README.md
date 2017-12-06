# v (Mediasite Video Platform)

**Convert P2G (publish-to-go) package to video podcast (vodcast).**



Vodcasts are MP4 files made of an audio recording and slides.


=head2 Description

F<vodcast.exe> takes a Mediasite presentation folder, finds a video recording and slides
and calls FFmpeg then. After that muxes slides and audio together.


## RELEASE NOTES

* folder should be unzipped and with a known directory structure

B<Vodcast> (MP4 file) and podcast (MP3 file) will be placed right inside the folder.

=cut

=head2 Installation

B<WINDOWS> version (executable)

It's written in Perl and distributed as a binary, together with FFmpeg build.

=cut

=head3 Downloading a Mediasite presentation

![](ps/1.png)
![](ps/2.png)

<https://mediasite.vse.cz/Mediasite/Catalog/help/catalog.html#!Documents/downloadportablepresentations.htm>

<http://edtech.ut.edu/media-site/127-downloading-a-mediasite-presentation>

<https://mediasite.online.ncsu.edu/online/Play/b6f97300e83b4b8dbcd312d33b9cd7f41d>


=head2 TODO

=over

=item *
native EXE (presumably in VisualBasic.NET)

I<Why?> the hassle of executing Windows Script Host just because of the platform file dialog

and too keep Perl simple at the same time

=back


=head2 Thanks

=over

=item *
L<https://ffmpeg.zeranoe.com/builds/>

=item *
L<http://ffmpeg.org/ffmpeg-formats.html#concat>

=item *
L<https://metacpan.org/pod/PAR::Packer>

=item *
L<http://www.indigostar.com/perl2exe.php>

=back


## LICENSE

Released into the public domain.

## DISCLAIMER

Don't blame me.
