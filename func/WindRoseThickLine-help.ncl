THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Wind_rose/WindRoseThickLine.shtml
THE_TITLE:WindRoseThickLine
   NCL Home > Documentation > Functions > Graphics routines

WindRoseThickLine

   Plot a black and white wind rose diagram where different line thicknesses are used to differentiate speed ranges.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/wind_rose.ncl"

        function WindRoseThickLine (
                wks        : graphic,
                wspd       : numeric,
                wdir       : numeric,
                numPetals  : integer,
                circFr     : float,
                spdBounds  : float,
                res        : graphic
        )

        return_val  :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from calling gsn_open_wks or calling create to create a
   Workstation object.
   wspd

   A one-dimensional array of wind speeds (any units).
   wdir

   A one-dimensional array of wind direction (degrees). The wind directions are meteorological; that is, 90 degrees means
   blowing from the east.
   numPetals

   Number of wind rose directions.
   circFr

   Intervals at which frequency circles are drawn.
   spdBounds

   Bounds for different colors.
   res

   A variable containing an optional list of plot resources, attached as attributes. Set to True if you want the attached
   attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources
   applied. A common resource to set is the plot title tiMainString.

Return value

   A plot identifier of the wind rose is returned.

Description

   This function creates a wind rose (i.e. a frequency of wind direction plus average speed). Speed ranges are
   differentiated via different line thicknessess.

See Also

   WindRoseBasic, WindRoseColor

Examples

   See: Example 2 of the wind rose examples.


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
