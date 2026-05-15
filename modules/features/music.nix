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

      programs.rmpc = {
        enable = true;

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
          		method: Auto,
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
          				direction: Horizontal,
          				panes: [(size: "100%", pane: Pane(Queue))],
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

      home.packages = with pkgs; [
        # essential btw
        cava
        mpc
      ];
    };
}
