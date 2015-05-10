static const char font[]            = "-*-terminus-medium-r-*-*-16-*-*-*-*-*-*-*";
static const char normbordercolor[] = "#2C2E2F";
static const char normbgcolor[]     = "#000000";
static const char normfgcolor[]     = "#ffffff";
static const char selbordercolor[]  = "#d91161";
static const char selbgcolor[]      = "#2C2E2F";
static const char selfgcolor[]      = "#eeeeee";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 16;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = False;    /* False means bottom bar */
static const float mfact      		= 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      		= 1;    /* number of clients in master area */
static const Bool resizehints 		= False; /* True means respect size hints in tiled resizals */

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "NULL",  	  NULL,       NULL,       0,       False,       -1 },
};

/* layout(s) */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	//{ "<>",      NULL },    /* no layout function means floating behavior */
};

static const char *dmenucmd[] = { "dmenu_run", NULL };
static const char *termcmd[]  = { "st", NULL };

#define MODKEY Mod4Mask
#define ALTGR Mod5Mask
/* toggleview is temporary peeking at another tag, bringing it's window to the current tag */
/* toggletag is moving the current window to another tag WHILE keeping it in the current tag. */
#define TAGKEYS(KEY,TAG) \
	{ NULL,             KEY,      view,           {.ui = 1 << TAG} }, \
	{ Mod1Mask,         KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY,           KEY,      tag,            {.ui = 1 << TAG} }, \
	{ ControlMask, 	    KEY,      toggletag,      {.ui = 1 << TAG} },

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ 0,	                        XK_F12,    spawn,          {.v = termcmd } },
	{ MODKEY,             			XK_space,  spawn,          {.v = dmenucmd } },
	{ 0,		                    XK_Menu,   view,           {0} },
	{ MODKEY,			            XK_Menu,   zoom,           {0} },
	{ MODKEY,                       XK_n,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_Left,   shiftview,      {.i = -1 } },
	{ MODKEY,                       XK_Right,  shiftview,      {.i = +1 } },
	{ 0,                       		XK_Pause,   shiftview,      {.i = -1 } },
	{ 0,                       		XK_Scroll_Lock,  shiftview,      {.i = +1 } },
	{ ALTGR,                       XK_Pause,      focusstack,     {.i = +1 } },
	{ ALTGR,                       XK_Scroll_Lock,      focusstack,     {.i = -1 } },
	TAGKEYS(                        XK_F1,                      0)
	TAGKEYS(                        XK_F2,                      1)
	TAGKEYS(                        XK_F3,                      2)
	TAGKEYS(                        XK_F4,                      3)
	TAGKEYS(                        XK_F5,                      4)
	TAGKEYS(                        XK_F6,                      5)
	TAGKEYS(                        XK_F7,                      6)
	TAGKEYS(                        XK_F8,                      7)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

