import { extendTheme } from "@chakra-ui/react";

export const theme = extendTheme({
  styles: {
    global: {
      "html, body, #root": {
        color: "gray.100",
        bgColor: "#111111",
      },
      body: {
        overflowY: "scroll",
        "&::-webkit-scrollbar": {
          width: "8px",
          height: "6px",
          background: "gray.600",
        },
        "&::-webkit-scrollbar-thumb": {
          background: "#fe7700",
          borderRadius: "4px",
        },
        "&::-webkit-scrollbar-thumb:hover": {
          background: "#fe7000",
        },
      },
    },
  },
  fonts: {
    heading: "Rubik",
    body: "Rubik",
  },
  colors: {
    black: {
      500: "#111111",
    },
    gray: {
      100: "#F2F2F2",
      200: "#C9C9C9",
      300: "#999999",
      400: "#75747E",
      500: "#1c1c1c",
      600: "#2b2b2b",
      700: "#24262F",
    },
    orange: {
      300: "#fe7000",
      400: "#F58401",
      500: "#C76607",
    },
    orangeGradient: {
      start: "#F08200",
      end: "#B75C09",
    },
  },
  zIndices: {
    hide: -1,
    auto: "auto",
    base: 0,
    docked: 10,
    dropdown: 1000,
    sticky: 1100,
    banner: 1200,
    overlay: 1300,
    modal: 1400,
    popover: "1500 !important",
    skipLink: 1600,
    toast: 1700,
    tooltip: 1800,
  },
  breakpoints: {
    base: "0px",
    sm: "320px",
    md: "768px",
    lg: "960px",
    xl: "1700px",
    "2xl": "1900px",
  },
  components: {
    Button: {
      baseStyle: {
        color: "gray.100",
        fontWeight: "medium",
        borderRadius: 3,
        transition: "0.3s",
        _hover: {
          filter: "brightness(0.8)",
        },
        _disabled: {
          pointerEvents: "none",
        },
      },
      sizes: {
        sm: {
          fontSize: "xs",
          height: "24px",
          minHeight: 6,
          px: 3,
        },
        md: {
          fontSize: "sm",
          height: "auto",
          minHeight: 9,
          px: 5,
        },
        lg: {
          fontSize: "md",
          height: "auto",
          minHeight: 12,
          px: 10,
        },
      },
      variants: {
        primary: {
          bg: "#fe7700",
          boxShadow: "-1px 3px 2px rgba(0, 0, 0, 0.19)",
          _active: {
            bgGradient: "linear(to-b, #B75C09, #F08200)",
            boxShadow: "inset 0px 0px 0px 1px rgba(255, 255, 255, 0.24)",
          },
          _hover: {
            bgGadient: "linear(to-b, #B75C09, #F08200)",
          },
        },
        green: {
          button: {
            height: "23px",
            bg: "#1B931B",
            transition: "0.3s",
            _hover: {
              filter: "brightness(0.8)",
            },
            _active: {
              filter: "brightness(0.8)",
            },
          },
        },
        secondary: {
          bg: "gray.400",
          color: "white",
          _active: {
            bgGradient: "linear(to-b, #4B495A, #75747E)",
            boxShadow: "inset 0px 0px 0px 1px rgba(255, 255, 255, 0.24)",
          },
          _disabled: {
            opacity: 0.8,
            cursor: "not-allowed",
          },
        },
        tertiary: {
          color: "#1c1c1c",
          bgColor: "#ffff",
          _active: {
            bgGradient: "linear(to-b, #7A7B7F, #C9C9C9)",
            boxShadow: "inset 0px 0px 0px 1px rgba(255, 255, 255, 0.24)",
          },
        },
        blackFriday: {
          bgColor: "#111111",
          color: "white",
        },
        christmas: {
          bgColor: "#ffaa00",
          color: "#111111",
        },
        blackFridayInverted: {
          bgColor: "white",
          color: "#111111",
        },
        neutral: {
          bgColor: "gray.500",
        },
        ghost: {
          _hover: {
            bgColor: "gray.500",
          },
          _active: {
            bgColor: "gray.500",
            filter: "brightness(0.8)",
          },
        },
      },
    },
    Menu: {
      baseStyle: {
        button: {
          transition: "0.3s",
          _hover: {
            filter: "brightness(0.8)",
          },
          _active: {
            filter: "brightness(0.8)",
          },
        },
        list: {
          fontSize: "xs",
          bgColor: "#2b2b2b",
          border: "none",
          borderRadius: "base",
          boxShadow: "0px 1px 2px rgba(0, 0, 0, 0.25)",
        },
        item: {
          color: "gray.100",
          fontWeight: "medium",
          bgColor: "rgba(255, 255, 255, 0)",
          _hover: {
            bgColor: "rgba(255, 255, 255, 0.06)",
          },
        },
      },
    },
    Input: {
      variants: {
        outline: {
          field: {
            color: "gray.100",
            fontSize: "sm",
            bgColor: "gray.600",
            borderColor: "gray.600",
            px: 2.5,
            "::placeholder": {
              color: "gray.300",
            },
            _hover: {
              borderColor: "gray.600",
            },
          },
        },
        filled: {
          field: {
            color: "#111111",
            bgColor: "white",
            "::placeholder": {
              color: "black",
            },
            _hover: {
              bgColor: "white",
            },
            _focus: {
              bgColor: "white",
            },
          },
        },
      },
    },
    Switch: {
      baseStyle: {
        track: {
          bgColor: "gray.100",
          padding: 0,
          height: 5,
          width: 8,
          boxShadow: "-1px 3px 2px rgba(0, 0, 0, 0.19)",
          _checked: {
            bgGradient: "linear(to-b, #F08200, #B75C09)",
          },
        },
        thumb: {
          bgGradient: "linear(to-b, #F08200, #B75C09)",
          boxSize: 5,
          _checked: {
            bgGradient: "none",
            bgColor: "gray.100",
          },
        },
      },
    },
    Card: {
      baseStyle: {
        container: {
          color: "gray.100",
          bgColor: "gray.600",
          borderRadius: "10px",
        },
      },
    },
    Modal: {
      parts: ["header"],
      baseStyle: {
        header: {
          lineHeight: "1.6rem",
        },
      },
    },
    Divider: {
      baseStyle: {
        borderColor: "gray.600",
        borderBottomWidth: "2px",
        rounded: "5rem",
      },
    },
    Tabs: {
      baseStyle: {
        tablist: {
          mb: 5,
        },
        tabpanel: {
          padding: 0,
        },
      },
    },
    Progress: {
      variants: {
        primary: {
          track: {
            bgColor: "gray.700",
          },
          filledTrack: {
            bgColor: "orange.400",
          },
        },
        secondary: {
          track: {
            bgColor: "#54555B",
            borderRadius: "32px",
          },
          filledTrack: {
            background: "linear-gradient(180deg, #F08200 0%, #B75C09 100%)",
            borderRadius: "32px 4px 4px 32px",
          },
        },
        terceiro: {
          track: {
            bgColor: "#54555B",
            borderRadius: "32px",
          },
          filledTrack: {
            background:
              "linear-gradient(to right, transparent 0%, #F08200 50%, transparent 100%)",
          },
        },
      },
    },
    Tag: {
      variants: {
        tertiary: {
          container: {
            fontSize: "xs",
            borderRadius: 3,
            color: "#54555B",
            bgGradient: "linear(to-b, #C9C9C9, #7A7B7F)",
            boxShadow: "-1px 3px 2px rgba(0, 0, 0, 0.19)",
          },
        },
      },
    },
  },
});
("");
