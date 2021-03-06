THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/NhlNDCPolygon.shtml
THE_TITLE:NhlNDCPolygon
   NCL Home > Documentation > Functions > Graphics routines

NhlNDCPolygon

   Draws a polygon using NDC coordinates.

Prototype

        procedure NhlNDCPolygon (
                objects [*] : graphic,
                style   [*] : graphic,
                x       [*] : float,
                y       [*] : float
        )

Arguments

   objects

   An array of plot objects. Plot object are created by using one of the many GSN plotting functions, or by calling the NCL
   create language construct.
   style

   A scalar or an array of the same length as objects containing NCL style objects.
   x
   y

   Arrays containing the X and Y coordinates of the polygon in NDC coordinates. They must be the same length.

Description

   NhlNDCPolygon draws the polygon defined by the pair of vectors x and y using either a single style object or the
   corresponding style object from the style parameter. The vectors x and y contain values in NDC units. The coordinates are
   drawn as a polygon clipped to the viewports of each HLU plot object in the objects array.

   The difference between the NCL version and the HLU version is that the NCL version draws the polygon over one or more HLU
   plot objects using one or more styles, and the NCL version does not need the length of the x and y parameters because
   this information is inherent in NCL data. In the HLU version, NULL can be used to use the default graphic style object.
   In NCL, however, the default style object must be retrieved from the workstation parent using the wkDefGraphicStyleId
   resource and the getvalues statement.

   For more information on controlling how the polygon is drawn and filled, see the GraphicStyle class description.

   Note: it is recommended that you use the gsn_polygon_ndc procedure instead, because it allows you to input X and Y arrays
   of any numeric type, it checks for missing values, it doesn't require a style object, and it allows you to include a list
   of optional resources.

See Also

   gsn_polygon_ndc, gsn_polygon, gsn_polyline_ndc, gsn_polyline, gsn_polymarker_ndc, gsn_polymarker, NhlDataPolygon,
   NhlDataPolyline, NhlDataPolymarker, NhlNDCPolyline, NhlNDCPolymarker

Examples

   Example 1

   This example creates a "canvas" object, and then draws a polygon, polymarkers, and a polyline on it. See example 2 for
   the same thing accomplished with GSN functions.

begin
  wks = create "poly" xWorkstationClass defaultapp end create

;
; Create some data arrays.
;
  plx = (/ 0.10, 0.90, 0.50, 0.10 /)
  ply = (/ 0.10, 0.10, 0.90, 0.10 /)
  pmx = (/ 0.05, 0.95, 0.50, 0.50 /)
  pmy = (/ 0.10, 0.10, 0.95, 0.50 /)
  pgx = (/ 0.20, 0.80, 0.50, 0.20 /)
  pgy = (/ 0.25, 0.25, 0.85, 0.25 /)
;
; Create a LogLinPlot that covers the entire NDC space
; to use as a drawing canvas.
;
  canvas = create "canvas" logLinPlotClass wks
    "vpXF"      : 0.0
    "vpYF"      : 1.0
    "vpWidthF"  : 1.0
    "vpHeightF" : 1.0
  end create

;
; Create a GraphicStyle object.
;
  gsid = create "style" graphicStyleClass wks end create

  setvalues gsid
    "gsFillColor"       : "red"     ; polygon fill color
    "gsLineDashPattern" : 2         ; polyline dash pattern
    "gsLineThicknessF"  : 3.0       ; polyline thickness
    "gsLineColor"       : "purple"  ; polyline color
    "gsMarkerIndex"     : 16        ; marker style
    "gsMarkerColor"     : "green"   ; marker color
    "gsMarkerSizeF"     : 0.02      ; marker size
  end setvalues

;
; Draw the polyline, polygon, and polymarkers.
;
  NhlNDCPolyline(canvas,gsid,plx,ply)
  NhlNDCPolygon(canvas,gsid,pgx,pgy)
  NhlNDCPolymarker(canvas,gsid,pmx,pmy)

  frame(wks)
end

   Example 2

   This example is identical to example 1, except it shows how to use GSN functions to accomplish the same thing with
   slightly less code:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  wks = gsn_open_wks("x11","test")

;
; Create some data arrays.
;
  plx = (/ 0.10, 0.90, 0.50, 0.10 /)
  ply = (/ 0.10, 0.10, 0.90, 0.10 /)
  pmx = (/ 0.05, 0.95, 0.50, 0.50 /)
  pmy = (/ 0.10, 0.10, 0.95, 0.50 /)
  pgx = (/ 0.20, 0.80, 0.50, 0.20 /)
  pgy = (/ 0.25, 0.25, 0.85, 0.25 /)

;
; Set up some poly resources.
;
  gsres = True
  gsres@gsFillColor       = "red"     ; polygon fill color
  gsres@gsLineDashPattern = 2         ; polyline dash pattern
  gsres@gsLineThicknessF  = 3.0       ; polyline thickness
  gsres@gsLineColor       = "purple"  ; polyline color
  gsres@gsMarkerIndex     = 16        ; marker style
  gsres@gsMarkerColor     = "green"   ; marker color
  gsres@gsMarkerSizeF     = 0.02      ; marker size

;
; Draw the polyline, polygon, and polymarkers.
;
  gsn_polyline_ndc(wks,plx,ply,gsres)
  gsn_polygon_ndc(wks,pgx,pgy,gsres)
  gsn_polymarker_ndc(wks,pmx,pmy,gsres)

  frame(wks)
end


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
