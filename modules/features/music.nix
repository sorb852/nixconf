{
  flake.homeModules.music =
    {
      self,
      config,
      pkgs,
      ...
    }:
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

        # TODO: Configure the keybinds to my needs
        config = ''
          #![enable(implicit_some)]
          #![enable(unwrap_newtypes)]
          #![enable(unwrap_variant_newtypes)]
          (
            // address: "127.0.0.1:6600",
            // password: None,
          	cache_dir: None,
          	volume_step: 5,
          	max_fps: 30,
          	scrolloff: 1,
          	wrap_navigation: false,
          	enable_mouse: true,
          	enable_config_hot_reload: true,
          	status_update_interval_ms: 2000, // 1000, but lets js make it a bit more energy efficient
          	show_playlists_in_browser: None,
          	center_current_song_on_change: true,
          	rewind_to_start_sec: None,
          	reflect_changes_to_playlist: false,
          	select_current_song_on_change: false,
          	artists: (
          		// album_display_mode: SplitByDate,
          		// album_display_mode: NameOnly,
          		album_sort_by: Date,
          	),
          	
          	cava: (
          		framerate: 60,
          		autosens: true,
          		sensetivity: 90,
          		input: (
          			method: Fifo,
          			source: "/tmp/mpd.fifo",
          			sample_rate: 44100,
          			channels: 2,
          			sample_bit: 16,
          		),
          		smoothing: (
          			// waves: true,
          			// monstercat: true,
          		)
          	),


            album_art: (
                method: Kitty,
                max_size_px: (width: 1200, height: 1200),
                disabled_protocols: ["http://", "https://"],
                vertical_align: Center,
                horizontal_align: Center,
            ),
          	keybinds: (
          		global: {
          			":":       CommandMode,
          			",":       VolumeDown,
          			"s":       Stop,
          			".":       VolumeUp,
          			"<Tab>":   NextTab,
          			"<S-Tab>": PreviousTab,
          			"1":       SwitchToTab("Queue"),
          			"2":       SwitchToTab("Directories"),
          			"3":       SwitchToTab("Artists"),
          			"4":       SwitchToTab("Album Artists"),
          			"5":       SwitchToTab("Albums"),
          			"6":       SwitchToTab("Playlists"),
          			"7":       SwitchToTab("Search"),
          			"q":       Quit,
          			">":       NextTrack,
          			"p":       TogglePause,
          			"<":       PreviousTrack,
          			"f":       SeekForward,
          			"z":       ToggleRepeat,
          			"x":       ToggleRandom,
          			"c":       ToggleConsume,
          			"v":       ToggleSingle,
          			"b":       SeekBack,
          			"~":       ShowHelp,
          			"u":       Update,
          			"U":       Rescan,
          			"I":       ShowCurrentSongInfo,
          			"O":       ShowOutputs,
          			"P":       ShowDecoders,
          			"R":       AddRandom,
          		},
          		navigation: {
          			"k":         Up,
          			"j":         Down,
          			"h":         Left,
          			"l":         Right,
          			"<Up>":      Up,
          			"<Down>":    Down,
          			"<Left>":    Left,
          			"<Right>":   Right,
          			"<C-k>":     PaneUp,
          			"<C-j>":     PaneDown,
          			"<C-h>":     PaneLeft,
          			"<C-l>":     PaneRight,
          			"<C-u>":     UpHalf,
          			"N":         PreviousResult,
          			"a":         Add,
          			"A":         AddAll,
          			"r":         Rename,
          			"n":         NextResult,
          			"g":         Top,
          			"<Space>":   Select,
          			"<C-Space>": InvertSelection,
          			"G":         Bottom,
          			"<CR>":      Confirm,
          			"i":         FocusInput,
          			"J":         MoveDown,
          			"<C-d>":     DownHalf,
          			"/":         EnterSearch,
          			"<C-c>":     Close,
          			"<Esc>":     Close,
          			"K":         MoveUp,
          			"D":         Delete,
          			"B":         ShowInfo,
          		},
          		queue: {
          			"D":       DeleteAll,
          			"<CR>":    Play,
          			"<C-s>":   Save,
          			"a":       AddToPlaylist,
          			"d":       Delete,
          			"C":       JumpToCurrent,
          			"X":       Shuffle,
          		},
          	),
          	search: (
          		case_sensitive: false,
          		mode: Contains,
          		tags: [
          			(value: "any",         label: "Any Tag"),
          			(value: "artist",      label: "Artist"),
          			(value: "album",       label: "Album"),
          			(value: "albumartist", label: "Album Artist"),
          			(value: "title",       label: "Title"),
          			(value: "filename",    label: "Filename"),
          			(value: "genre",       label: "Genre"),
          		],
          	),
          	layout: Split(
          		direction: Vertical,
          		panes: [
          			(size: "4", border: "ALL", pane: Pane(Header)),
          			(size: "3", pane: Pane(Tabs)),
          			(size: "100%", border: "ALL", pane: Pane(TabContent)),
          			(size: "3", border: "ALL", pane: Pane(ProgressBar)),
          		]
          	),
          	tabs: [
          		(
          			name: "Queue",
          			pane: Split(
          				direction: Vertical,
          				panes: [
                    (size: "60%", pane: Pane(Queue)),
                    (size: "40%", pane: Split(
                      direction: Horizontal,
                      panes: [
                        (size: "70%", pane: Pane(Cava)),
                        (size: "30%", pane: Pane(AlbumArt))
                      ]
                    ))
                  ],
          			),
          		),
          		(
          			name: "Directories",
          			pane: Pane(Directories),
          		),
          		(
          			name: "Artists",
          			pane: Pane(Artists),
          		),
          		(
          			name: "Album Artists",
          			pane: Pane(AlbumArtists),
          		),
          		(
          			name: "Albums",
          			pane: Pane(Albums),
          		),
          		(
          			name: "Playlists",
          			pane: Pane(Playlists),
          		),
          		(
          			name: "Search",
          			pane: Pane(Search),
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
            default_album_art_path: None,
            format_tag_separator: " | ",
            browser_column_widths: [20, 38, 42],
            background_color: None,
            text_color: None,
            header_background_color: None,
            modal_background_color: None,
            modal_backdrop: false,
            preview_label_style: (fg: "yellow"),
            preview_metadata_group_style: (fg: "yellow", modifiers: "Bold"),
            highlighted_item_style: (fg: "blue", modifiers: "Bold"),
            current_item_style: (fg: "black", bg: "blue", modifiers: "Bold"),
            borders_style: (fg: "blue"),
            highlight_border_style: (fg: "blue"),
            symbols: (
                song: "󰝚",
                dir: "",
                playlist: "󱍙",
                marker: "󰀫",
                ellipsis: "...",
                song_style: None,
                dir_style: None,
                playlist_style: None,
            ),
            level_styles: (
                info: (fg: "blue", bg: "black"),
                warn: (fg: "yellow", bg: "black"),
                error: (fg: "red", bg: "black"),
                debug: (fg: "light_green", bg: "black"),
                trace: (fg: "magenta", bg: "black"),
            ),
            progress_bar: (
                symbols: ["├", "─", "┤", "┄", "┤"],
                track_style: None,
                elapsed_style: (fg: "blue"),
                thumb_style: (fg: "blue"),
                use_track_when_empty: false,
            ),
            scrollbar: (
                symbols: ["│", "█", "┬", "┴"],
                track_style: (),
                ends_style: (),
                thumb_style: (fg: "blue"),
            ),
            tab_bar: (
                active_style: (fg: "black", bg: "blue", modifiers: "Bold"),
                inactive_style: (),
            ),
            lyrics: (
                timestamp: false
            ),
            browser_song_format: [
                (
                    kind: Group([
                        (kind: Property(Track)),
                        (kind: Text(" ")),
                    ])
                ),
                (
                    kind: Group([
                        (kind: Property(Artist)),
                        (kind: Text(" - ")),
                        (kind: Property(Title)),
                    ]),
                    default: (kind: Property(Filename))
                ),
            ],
            song_table_format: [
                (
                    prop: (kind: Property(Artist),
                        default: (kind: Text("Unknown"))
                    ),
                    label_prop: (kind: Text("Artist")),
                    width: "20%",
                ),
                (
                    prop: (kind: Property(Title),
                        default: (kind: Text("Unknown"))
                    ),
                    label_prop: (kind: Text("Title")),
                    width: "35%",
                ),
                (
                    prop: (kind: Property(Album), style: (fg: "white"),
                        default: (kind: Text("Unknown Album"), style: (fg: "white"))
                    ),
                    label_prop: (kind: Text("Album")),
                    width: "30%",
                ),
                (
                    prop: (kind: Property(Duration),
                        default: (kind: Text("-"))
                    ),
                    label_prop: (kind: Text("Duration")),
                    width: "15%",
                    alignment: Right,
                ),
            ],
            layout: Split(
                direction: Vertical,
                panes: [
                    (
                        size: "4",
                        pane: Split(
                            direction: Horizontal,
                            panes: [
                                (
                                    size: "35",
                                    borders: "LEFT | TOP | BOTTOM",
                                    border_symbols: Inherited(parent: Rounded, bottom_left: "├"),
                                    pane: Component("header_left")
                                ),
                                (
                                    size: "100%",
                                    borders: "ALL",
                                    border_symbols: Inherited(parent: Rounded, top_left: "┬", top_right: "┬", bottom_left: "┴", bottom_right: "┴"),
                                    pane: Component("header_center")
                                ),
                                (
                                    size: "35",
                                    borders: "RIGHT | TOP | BOTTOM",
                                    border_symbols: Inherited(parent: Rounded, bottom_right: "┤"),
                                    pane: Component("header_right")
                                ),
                            ]
                        )
                    ),
                    (
                        pane: Pane(Tabs),
                        borders: "RIGHT | LEFT | BOTTOM",
                        border_symbols: Rounded,
                        size: "2",
                    ),
                    (
                        pane: Pane(TabContent),
                        size: "100%",
                    ),
                    (
                        size: "3",
                        pane: Split(
                            direction: Horizontal,
                            panes: [
                                (
                                    size: "12",
                                    borders: "ALL",
                                    border_symbols: Inherited(parent: Rounded, top_right: "┬", bottom_right: "┴"),
                                    pane: Component("input_mode")
                                ),
                                (
                                    size: "100%",
                                    borders: "TOP | BOTTOM | RIGHT",
                                    border_symbols: Rounded,
                                    border_title: [(kind: Text(" ")), (kind: Property(Status(QueueLength()))), (kind: Text(" songs / ")), (kind: Property(Status(QueueTimeTotal()))), (kind: Text(" total time "))],
                                    border_title_alignment: Right,
                                    pane: Component("progress_bar"),
                                ),
                            ]
                        ),
                    ),
                ],
            ),
            components: {
                "state": Pane(Property(
                    content: [
                        (kind: Text("["), style: (fg: "yellow", modifiers: "Bold")),
                        (kind: Property(Status(StateV2( ))), style: (fg: "yellow", modifiers: "Bold")),
                        (kind: Text("]"), style: (fg: "yellow", modifiers: "Bold")),
                    ], align: Left,
                )),
                "title": Pane(Property(
                    content: [
                        (kind: Property(Song(Title)), style: (modifiers: "Bold"),
                            default: (kind: Text("No Song"), style: (modifiers: "Bold"))),
                    ], align: Center, scroll_speed: 1
                )),
                "volume": Split(
                    direction: Horizontal,
                    panes: [
                        (size: "1", pane: Pane(Property(content: [(kind: Text(""))]))),
                        (size: "100%", pane: Pane(Volume(kind: Slider(symbols: (filled: "─", thumb: "●", track: "─"))))),
                        (size: "3", pane: Pane(Property(content: [(kind: Property(Status(Volume)), style: (fg: "blue"))], align: Right))),
                        (size: "2", pane: Pane(Property(content: [(kind: Text("%"), style: (fg: "blue"))]))),
                    ]
                ),
                "elapsed_and_bitrate": Pane(Property(
                    content: [
                        (kind: Property(Status(Elapsed))),
                        (kind: Text(" / ")),
                        (kind: Property(Status(Duration))),
                        (kind: Group([
                            (kind: Text(" (")),
                            (kind: Property(Status(Bitrate))),
                            (kind: Text(" kbps)")),
                        ])),
                    ],
                    align: Left,
                )),
                "artist_and_album": Pane(Property(
                    content: [
                        (kind: Property(Song(Artist)), style: (fg: "yellow", modifiers: "Bold"),
                            default: (kind: Text("Unknown"), style: (fg: "yellow", modifiers: "Bold"))),
                        (kind: Text(" - ")),
                        (kind: Property(Song(Album)), default: (kind: Text("Unknown Album"))),
                    ], align: Center, scroll_speed: 1
                )),
                "states": Split(
                    direction: Horizontal,
                    panes: [
                        (
                            size: "1",
                            pane: Pane(Empty())
                        ),
                        (
                            size: "100%",
                            pane: Pane(Property(content: [(kind: Property(Status(InputBuffer())), style: (fg: "blue"), align: Left)]))
                        ),
                        (
                            size: "6",
                            pane: Pane(Property(content: [
                                (kind: Text("["), style: (fg: "blue", modifiers: "Bold")),
                                (kind: Property(Status(RepeatV2(
                                    on_label: "z",
                                    off_label: "z",
                                    on_style: (fg: "yellow", modifiers: "Bold"),
                                    off_style: (fg: "blue", modifiers: "Dim"),
                                )))),
                                (kind: Property(Status(RandomV2(
                                    on_label: "x",
                                    off_label: "x",
                                    on_style: (fg: "yellow", modifiers: "Bold"),
                                    off_style: (fg: "blue", modifiers: "Dim"),
                                )))),
                                (kind: Property(Status(ConsumeV2(
                                    on_label: "c",
                                    off_label: "c",
                                    oneshot_label: "c",
                                    on_style: (fg: "yellow", modifiers: "Bold"),
                                    off_style: (fg: "blue", modifiers: "Dim"),
                                    oneshot_style: (fg: "red", modifiers: "Dim"),
                                )))),
                                (kind: Property(Status(SingleV2(
                                    on_label: "v",
                                    off_label: "v",
                                    oneshot_label: "v",
                                    on_style: (fg: "yellow", modifiers: "Bold"),
                                    off_style: (fg: "blue", modifiers: "Dim"),
                                    oneshot_style: (fg: "red", modifiers: "Bold"),
                                )))),
                                (kind: Text("]"), style: (fg: "blue", modifiers: "Bold")),
                                ],
                                align: Right
                            ))
                        ),
                    ]
                ),
                "input_mode": Pane(Property(
                    content: [
                        (kind: Transform(Replace(content: (kind: Property(Status(InputMode()))), replacements: [
                            (match: "Normal", replace: (kind: Text(" NORMAL "), style: (fg: "black", bg: "blue"))),
                            (match: "Insert", replace: (kind: Text(" INSERT "), style: (fg: "black", bg: "green"))),
                        ])))
                    ], align: Center
                )),
                "header_left": Split(
                    direction: Vertical,
                    panes: [
                        (size: "1", pane: Component("state")),
                        (size: "1", pane: Component("elapsed_and_bitrate")),
                    ]
                ),
                "header_center": Split(
                    direction: Vertical,
                    panes: [
                        (size: "1", pane: Component("title")),
                        (size: "1", pane: Component("artist_and_album")),
                    ]
                ),
                "header_right": Split(
                    direction: Vertical,
                    panes: [
                        (size: "1", pane: Component("volume")),
                        (size: "1", pane: Component("states")),
                    ]
                ),
                "progress_bar": Split(
                    direction: Horizontal,
                    panes: [
                        (
                            size: "1",
                            pane: Pane(Empty())
                        ),
                        (
                            size: "100%",
                            pane: Pane(ProgressBar)
                        ),
                        (
                            size: "1",
                            pane: Pane(Empty())
                        ),
                    ]
                )
            },
        )
      '';

      home.packages = with pkgs; [
        # essential btw
        cava
        mpc
      ];
    };
}
