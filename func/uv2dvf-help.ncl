THE_URL:file://localhost/Users/hubery/Public/ucar/Document/Functions/Built-in/uv2dvf.shtml
THE_TITLE:uv2dvf
   NCL Home > Documentation > Functions > Spherical harmonic routines

uv2dvf

   Computes the divergence using spherical harmonics given the u and v wind components on a fixed grid.

Prototype

        procedure uv2dvf (
                u   : numeric,
                v   : numeric,
                dv  : float or double
        )

Arguments

   u
   v

   wind components (input, arrays with two or more dimensions, rightmost two dimensions must be nlat x nlon)
     * input values must be in ascending latitude order
     * input array must be on a global grid

   dv

   divergence (output, same dimensions as u and v, values will be in ascending latitude order)

Description

   Given wind components u and v,uv2dvf computes the divergence and returns it in the array dv. uv2dvf operates on a fixed
   grid.

   This procedure does not allow for missing data (defined by the _FillValue attribute) to be present. If any missing values
   are encountered in a particular 2D input grid, then all of the values in the corresponding output grid will be set to the
   default missing value appropriate to the type of the output.

   Note, if the input arrays are not global or contain missing data, then it is recommended that uv2dv_cfd be used.

   Note: For the arrays whose rightmost two dimensions are nlat x nlon, the rest of the dimensions (if any) are collectively
   referred to as N. If the input/output arrays are just two dimensions, then N can either be considered equal to 1 or
   nothing at all.

   Arrays which have dimensions N x nlat x nlon should not include the cyclic (wraparound) points when invoking the
   procedures and functions which use spherical harmonics (Spherepack).

   If the input arrays u and v are on a gaussian grid, uv2dvg should be used. Also, note that uv2dvf is the procedural
   version of uv2dvF.

See Also

   uv2dvg, uv2dvF, uv2dvG, uv2dv_cfd, dv2uvf

Examples

   Example 1

   Calculate the divergence from the wind components u,v, and then calculate the divergent wind components. u and v are on a
   fixed grid.
begin
  nlat  = 90                                       ; dimensions
  mlon  = 180
  mlon1 = mlon+1
  fbfile = "uv300.hs"
                                       ; Generic Workstation setup
  nrec  = fbinnumrec(fbfile)           ; total number of records in the file
  ntim  = nrec/2                       ; number of time steps in dataset

  uvmsg = 1e+36

  dv    = new ( (/nlat,mlon /), float, uvmsg )  ; divergence
  ud    = new ( (/nlat,mlon /), float, uvmsg )
  vd    = new ( (/nlat,mlon /), float, uvmsg )

  do i = 0,nrec-1,2
   month = 1                         ; january
   if (i .ge. 2) then
       month = 7                     ; july
   end if

   work = fbinrecread(fbfile,i  ,(/nlat,mlon1/),"float")
   u    = work(:,0:mlon-1)
   work = fbinrecread(fbfile,i+1,(/nlat,mlon1/),"float")
   v    = work(:,0:mlon-1)

   uv2dvf   (u,v,dv)                 ; u,v ==> divergence
   dv2uvf   (dv,  ud,vd)             ; dv  ==> divergent  wind components
  end do
end

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   �2015 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster | Sponsored by NSF
