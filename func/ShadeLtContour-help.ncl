THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Shea_util/ShadeLtContour.shtml
THE_TITLE:ShadeLtContour
   NCL Home > Documentation > Functions > Graphics routines

ShadeLtContour

   Shades contour regions below a given value with the given fill pattern.
   (Superceded by gsn_contour_shade as of version 4.3.0.)

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        function ShadeLtContour (
                plot [1] : graphic,
                value    : float,
                pattern  : integer
        )

        return_val [1] :  graphic

Arguments

   plot

   The plot to be modified.
   value

   Starting with the first contour less then value, all areas less than that first contour will be shaded with fill pattern
   pattern.
   pattern

   The fill pattern to use to shade the given areas.

Return value

   plot is returned with the modifications described above.

Description

   Starting with the first contour less than value, shades all regions less than that first contour with the given fill
   pattern.

   Note that the shading begins at the first contour level less than value, and not at the specified value. Check your plot
   to make sure that the results are what you expected.

See Also

   gsn_contour_shade, ColorNegDashZeroPosContour, ColorShadeLeGeContour, ShadeGeLeContour, ShadeGtContour, ShadeLtContour,
   ShadeLtGtContour

Examples

   For some application examples, see:
     * "coneff_7.ncl" (view example)
     * "panel_7.ncl" (view example)


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
