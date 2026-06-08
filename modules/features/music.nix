{ self, ... }:
{
  flake.homeModules.music =
    { pkgs, ... }:

    {
      services.mpd = {
        enable = true;
        musicDirectory = "~/Music/Library/";
        extraConfig = ''
          audio_output {
              type "pipewire"
              name "Pipewire Sound Server"
          }

          audio_output {
             type   "fifo"
             name   "my_fifo"
             path   "/tmp/mpd.fifo"
             format "44100:16:2"
          }
        '';
      };
      services.mpdris2 = {
        enable = true;
        notifications = true;
        # mpd.musicDirectory = config.services.mpd.musicDirectory;
        mpd.musicDirectory = null;
      };

      programs.rmpc = {
        enable = true;
        config = ''
          #![enable(implicit_some)]
          #![enable(unwrap_newtypes)]
          #![enable(unwrap_variant_newtypes)]
          (
            // consider on_song_change
            scrolloff: 1,
            theme: Some("./theme.ron"),

            cava: (
              framerate: 60,
              autosens: true,
              sensetivity: 100,
              input: (
                method: Fifo,
                source: "/tmp/mpd.fifo",
                sample_rate: 44100,
                channels: 2,
                sample_bit: 16,
              ),
              smoothing: (
                noise_reduction: 77,
              )
            ),
            album_art: (
              method: Kitty,
              vertical_align: Center,
              horizontal_align: Center,
            ),
            keybinds: (
              clear: true,
              global: {
                "q": Quit,
                "?": ShowHelp,
                ":": CommandMode,

                "z": ToggleRepeat,
                "x": ToggleRandom,
                "c": ToggleSingleOnOff,

                "p": TogglePause,
                "s": Stop,

                "<": PreviousTrack,
                ">": NextTrack,

                "f": SeekForward,
                "b": SeekBack,
                "0": SeekToStart,

                "-": VolumeDown,
                "=": VolumeUp, // look i want both of them to do the same thing without one having shift

                "1": SwitchToTab("Queue"),
                "2": SwitchToTab("Artists"),
                "3": SwitchToTab("Albums"),
                "4": SwitchToTab("Playlists"),
              },
              navigation: {
                "<Esc>": Close,
                "<Enter>": Confirm,

                "h": Left,
                "j": Down,
                "k": Up,
                "l": Right,
                "<Left>": Left,
                "<Down>": Down,
                "<Up>": Up,
                "<Right>": Right,
                "<C-u>": UpHalf,
                "<C-d>": DownHalf,
                "gg": Top,
                "G": Bottom,

                "<Space>": Select,
                "<C-Space>": InvertSelection,

                "K": MoveUp,
                "J": MoveDown,

                "/": EnterSearch,
                "<C-n>": NextResult,
                "<C-p>": PreviousResult,

                "a": Add,
                "A": AddAll,
                "D": Delete,
                "<C-r>": Rename,
                "<C-z>": ContextMenu(),
                "<C-s>": Save(kind: Modal(all: false, duplicates_strategy: Ask)),
                "<C-D>": DeleteFromPlaylist(kind: Modal()),
              },
              queue: {
                "d": Delete,
                "D": DeleteAll,
                "<Enter>": Play,
                "C": JumpToCurrent,
                "X": Shuffle,
              }
            ),
            tabs: [
              (
                name: "Queue",
                pane: Pane(Queue),
              ),
              (
                name: "Artists",
                pane: Pane(Artists),
              ),
              (
                name: "Albums",
                pane: Pane(Albums),
              ),
              (
                name: "Playlists",
                pane: Pane(Playlists),
              ),
            ],
          )
        '';
      };
      xdg.configFile."rmpc/theme.ron".text = ''
        #![enable(implicit_some)]
        #![enable(unwrap_newtypes)]
        #![enable(unwrap_variant_newtypes)]
        (
          default_album_art_path: Some("${./assets/thedisintegrationloop.png}"), // Broter, this is the tuffest thing I have ever seen 🗿. Edit this over Tiki Tiki funk, capiche?
          symbols: (
            song: "󰝚 ",
            dir: " ",
            playlist: " ",
            marker: "> ",
            ellipsis: "...",
            song_style: None,
            dir_style: None,
            playlist_style: None,
          ),
          progress_bar: (
            symbols: ["╞", "═", "╡", "─", "┤"],
            track_style: (fg: "${self.theme.shade1}"),
            elapsed_style: (fg: "${self.theme.accent4}"),
            thumb_style: (fg: "${self.theme.accent4}"),
            use_track_when_empty: false
          ),
          scrollbar: (
            symbols: ["│", "█", "┬", "┴"],
            track_style: (fg: "${self.theme.shade1}"),
            ends_style: (fg: "${self.theme.shade1}"),
            thumb_style: (fg: "${self.theme.accent7}"),
          ),
          cava: (
            bar_color: Gradient({
              0  : "${self.theme.accent0}",
              14 : "${self.theme.accent1}",
              29 : "${self.theme.accent2}",
              43 : "${self.theme.accent3}",
              57 : "${self.theme.accent4}",
              71 : "${self.theme.accent5}",
              86 : "${self.theme.accent6}",
              100: "${self.theme.accent7}",
            })
          ),
          // background_color: "${self.theme.shade0}",
          // header_background_color: "${self.theme.shade1}",
          modal_background_color: "${self.theme.shade1}",
          modal_backdrop: true,
          text_color: "${self.theme.shade7}",
          preview_label_style: (fg: "${self.theme.accent7}"),
          preview_metadata_group_style: (fg: "${self.theme.accent1}"),
          tab_bar: (
            active_style: (fg: "${self.theme.shade1}", bg: "${self.theme.shade7}"),
            inactive_style: (fg: "${self.theme.shade7}"),
          ),
          highlighted_item_style: (bg: "${self.theme.shade0}", fg: "${self.theme.accent0}"),
          current_item_style: (bg: "${self.theme.shade1}", fg: "${self.theme.accent6}"),
          borders_style: (fg: "${self.theme.shade3}"),
          highlight_border_style: (fg: "${self.theme.shade4}"),
          song_table_format: [
            (
              prop: (
        	kind: Group([])
              ),
              width: "1",
            ),
            (
              prop: (
        	style: (fg: "${self.theme.accent1}"),
                kind: Property(Title),
                default: (kind: Text("Unknown track"))
              ),
              label: "Title",
              width: "50%",
            ),
            (
              prop: (
        	style: (fg: "${self.theme.accent4}"),
                kind: Property(Album),
                default: (kind: Text("Unknown Album"))
              ),
              label: "Album",
              width: "30%",
            ),
            (
              prop: (
        	style: (fg: "${self.theme.accent5}"),
                kind: Property(Artist),
                default: (kind: Text("Unknown artist"))
              ),
              label: "Artist",
              width: "20%",
            ),
            (
              prop: (
        	kind: Group([])
              ),
              width: "1",
            ),
          ],

          components: {
            "track_deco": Split(
              direction: Horizontal,
              panes: [
        	(
        	  size: "100%",
        	  pane: Pane(Cava),
        	  borders: "LEFT | TOP | BOTTOM",
        	  border_symbols: Inherited(parent: Plain, bottom_left: "├", top_left: "├"),
        	  border_title: [
        	    (
        	      kind: Group([
        		(
        	    	  kind: Text(" ")
        	    	),
        		(
        	    	  kind: Text("Now playing: ")
        	    	),
        		(
        		  kind: Property(Song(Title)),
        		  style: (fg: "${self.theme.accent3}")
        		),
        		(
        	    	  kind: Text(" ")
        	    	),
        	      ]),
        	      default: (kind: Text(" No song "), style: (fg: "${self.theme.accent0}"), modifiers: "Bold")
        	    ),
        	  ],
        	  border_title_alignment: Left
        	),
        	(
        	  size: "2.2r",
        	  borders: "LEFT | TOP | RIGHT | BOTTOM",
        	  border_symbols: Inherited(
        	    parent: Plain,
        	    bottom_left: "┴", top_left: "┬",
        	    bottom_right: "┤", top_right: "┤",
        	  ),
        	  pane: Pane(AlbumArt),
        	  border_title: [
        	    (
        	      kind: Group([
        		( kind: Text(" ["), style: (fg: "${self.theme.accent4}") ),
              		(
              		  kind: Property(Status(Elapsed)),
              		  style: (fg: "${self.theme.accent4}")
              		),
              		( kind: Text("/") ),
              		(
              		  kind: Property(Status(Duration)),
              		  style: (fg: "${self.theme.accent5}")
              		),
              		( kind: Text("] "), style: (fg: "${self.theme.accent5}") ),
        	      ]),
        	    ),
        	  ],
        	  border_title_alignment: Right
        	)
              ]
            ),
          },

          header: (
            rows: [
              (
        	left: [
        	  (kind: Property(Status(StateV2(
        	    playing_label: " 󰐊", paused_label: " 󰏤", stopped_label: " 󰓛",
        	    playing_style: (fg: "${self.theme.accent3}"),
        	    paused_style: (fg: "${self.theme.accent1}"),
        	    stopped_style: (fg: "${self.theme.accent0}"),
        	  )))),
              	  ( kind: Text(" | "), style: (fg: "${self.theme.shade6}")),
              	  // ( kind: Text("< "), style: (fg: "${self.theme.accent4}") ),
              	  (
              	    kind: Property(Status(Elapsed)),
              	    style: (fg: "${self.theme.accent4}")
              	  ),
              	  ( kind: Text(" of "), style: (fg: "${self.theme.shade6}")),
              	  (
              	    kind: Property(Status(Duration)),
              	    style: (fg: "${self.theme.accent5}")
              	  ),
              	  // ( kind: Text(" >"), style: (fg: "${self.theme.accent5}") ),
        	],
        	center: [
        	  (
        	    kind: Property(Song(Title)),
        	    style: (fg: "${self.theme.accent4}", modifiers: "Bold"),
        	    default: (kind: Text("No song"), style: (fg: "${self.theme.accent0}"))
        	  ),
        	  ( kind: Text(" by "), style: (fg: "${self.theme.shade7}") ),
        	  (
        	    kind: Property(Song(Artist)),
        	    style: (fg: "${self.theme.accent3}"),
        	    default: (kind: Text("Unknown artist"), style: (fg: "${self.theme.accent1}"))
        	  ),
        	],
        	right: [
        	  (kind: Property(Status(RepeatV2(on_label: "󰑖", off_label: "󰑖", on_style: (fg: "${self.theme.accent0}"), on_off: (fg: "#5e6387"))))),
        	  (kind: Text(" / "), style: (fg: "${self.theme.shade7}")),
        	  (kind: Property(Status(RandomV2(on_label: "󰒟", off_label: "󰒟", on_style: (fg: "${self.theme.accent1}"), on_off: (fg: "#5e6387"))))),
        	  (kind: Text(" / "), style: (fg: "${self.theme.shade7}")),
        	  (kind: Property(Status(SingleV2(on_label: "󰎄", off_label: "󰎄", on_style: (fg: "${self.theme.accent2}"), on_off: (fg: "#5e6387"))))),
        	  // (kind: Text(" / Vol at "), style: (fg: "${self.theme.shade7}")),
        	  (kind: Text(" / "), style: (fg: "${self.theme.shade7}")),
        	  (kind: Property(Status(Volume)), style: (fg: "${self.theme.accent5}")),
        	  (kind: Text("% "), style: (fg: "${self.theme.accent5}"))
        	],
              )
            ]
          ),

          layout: Split(
            direction: Vertical,
            panes: [
              (
        	size: "3",
        	borders: "ALL",
        	border_symbols: Inherited(parent: Plain, bottom_left: "├", bottom_right: "┤"),
        	pane: Pane(Tabs)
              ),
              (
        	size: "2",
        	borders: "BOTTOM | LEFT | RIGHT",
        	border_symbols: Inherited(parent: Plain, bottom_left: "├", bottom_right: "┤"),
        	pane: Pane(Header)
              ),
              (
        	size: "70%",
        	borders: "LEFT | RIGHT",
        	pane: Pane(TabContent)
              ),
              (
        	size: "30%",
        	pane: Component("track_deco")
              ),
              (
        	size: "2",
        	borders: "BOTTOM | LEFT | RIGHT",
        	pane: Pane(ProgressBar)
              ),
            ]
          )
        )
      '';

      home.packages = with pkgs; [
        # essential btw
        cava
        mpc
      ];
    };
}
