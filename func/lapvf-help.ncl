THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/lapvf.shtml
THE_TITLE:lapvf
   NCL Home > Documentation > Functions > Spherical harmonic routines

lapvf

   Computes the vector Laplacian using spherical harmonics, given a vector quantity (u,v) on a fixed grid.

Prototype

        procedure lapvf (
                u     : numeric,
                v     : numeric,
                ulap  : float or double,
                vlap  : float or double
        )

Arguments

   u
   v

   vector field arrays (input, two or more dimensions, last two dimensions must be nlat x nlon)
     * input values must be in ascending latitude order
     * input arrays must be on a global grid

   ulap
   vlap

   vector Laplacian arrays (output, same dimensions as u, v, values will be in ascending latitude order)

Description

   Given vector field u and v, lapvf computes the Laplacian vector and returns the results in the arrays ulap and vlap.
   lapvf operates on a fixed grid. If the input arrays u and v are on a gaussian grid, lapvg should be used.

   This procedure does not handle missing values. If any missing values are encountered in a particular 2D input grid, then
   all of the values in the corresponding output grids will be set to the missing value defined by the output grids'
   _FillValue attributes.

   Note: For the arrays whose last two dimensions are nlat x nlon, the rest of the dimensions (if any) are collectively
   referred to as N. If the input/output arrays are just two dimensions, then N can either be considered equal to 1 or
   nothing at all.

   Arrays which have dimensions N x nlat x nlon should not include the cyclic (wraparound) points when invoking the
   procedures and functions which use spherical harmonics (Spherepack).

   For example, if an array x has dimensions nlat = 64 and nlon = 129, where the "129" represents the cyclic points, then
   the user should pass the data to the procedure/function via:
    z = sample ( x([...],:,0:nlon-2) )  ; does not include cyclic points

See Also

   lapvg, lapsF, lapsG, ilapvf, ilapvg, ilapsf

Examples

   Example 1

   Read u and v (on a fixed grid) from a netCDF file and compute the vector laplacian:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
begin
   a = addfile("/cgd/cas/shea/MURPHYS/ATMOS/80.fixed.nc","r")
   v200 = a->V(0,{189.},:,:)                    ; v200 is dimensioned nlat x nlon
   u200 = a->U(0,{189.},:,:)                    ; u200 is dimensioned nlat x nlon
   printVarSummary(v200)
   lapl_v = v200                                ; preallocate space for the returned array
   lapl_u = u200                                ; preallocate space for the returned array
   lapvf(u200,v200,lapl_u,lapl_v)
end

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
