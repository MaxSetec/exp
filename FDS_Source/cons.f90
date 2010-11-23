MODULE GLOBAL_CONSTANTS
 
! Module containing global constants, parameters, variables
 
USE PRECISION_PARAMETERS
IMPLICIT NONE

CHARACTER(255), PARAMETER :: consid='$Id$'
CHARACTER(255), PARAMETER :: consrev='$Revision$'
CHARACTER(255), PARAMETER :: consdate='$Date$'

! Indices for various modes of operation

INTEGER, PARAMETER :: MIXTURE_FRACTION_SPECIES=1,GAS_SPECIES=2,AEROSOL_SPECIES=3            ! For SPECIES%MODE
INTEGER, PARAMETER :: MIXTURE_FRACTION_REACTION=1,FINITE_RATE_REACTION=2                    ! For REACTION%MODE
INTEGER, PARAMETER :: NET_FLUX_BC=0,INTERPOLATED_BC=6,SPECIFIED_TEMPERATURE=1, &
                      CONVECTIVE_FLUX_BC=-1,THERMALLY_THICK=3, &
                      INFLOW_OUTFLOW=4,NO_CONVECTION=2,VEG_BNDRY_FUEL=99                    ! Heat transfer BC
INTEGER, PARAMETER :: WALL_MODEL=2,FREE_SLIP_BC=3,NO_SLIP_BC=4,INTERPOLATED_VELOCITY_BC=6,& ! Velocity BC
                      HVAC_VBC=42
INTEGER, PARAMETER :: EXPOSED=0,VOID=1,INSULATED=2                                          ! Surface backing
INTEGER, PARAMETER :: SURF_CARTESIAN=0,SURF_CYLINDRICAL=1,SURF_SPHERICAL=2                  ! Surface geometry
INTEGER, PARAMETER :: NO_MASS_FLUX=1,SPECIFIED_MASS_FRACTION=2,SPECIFIED_MASS_FLUX=3,EMB_BC=4 ! Mass transfer BC
INTEGER, PARAMETER :: NULL_BOUNDARY=0,SOLID_BOUNDARY=1,OPEN_BOUNDARY=2,MIRROR_BOUNDARY=3, &
                      POROUS_BOUNDARY=4,VIRTUAL_BOUNDARY=5,INTERPOLATED_BOUNDARY=6,PERIODIC_BOUNDARY=7  ! Boundary Type
INTEGER, PARAMETER :: HVAC_BOUNDARY=42                      
INTEGER, PARAMETER :: NULL_EDGE=0,SOLID_EDGE=1,OPEN_EDGE=2,MIRROR_EDGE=3,SMOOTH_EDGE=4, &
                      INTERPOLATED_EDGE=6,PERIODIC_EDGE=7                                   ! Edge Type
INTEGER, PARAMETER :: DIRICHLET=1,NEUMANN=2,INTERNAL=3                                      ! Pressure Boundary Conditions
INTEGER, PARAMETER :: PYROLYSIS_NONE=0,PYROLYSIS_SOLID=1,PYROLYSIS_LIQUID=2,&
                      PYROLYSIS_MATERIAL=3,PYROLYSIS_SPECIFIED=4                            ! Pyrolysis model
INTEGER, PARAMETER :: ATMOSPHERIC=1, PARABOLIC=2, ONED_PARABOLIC=3                          ! Surface velocity profile
INTEGER, PARAMETER :: CELL_CENTER=1, CELL_FACE=2, CELL_EDGE=3                               ! Cell position for output quantities
INTEGER, PARAMETER :: NO_STOP=0, INSTABILITY_STOP=1, USER_STOP=2, SETUP_STOP=3              ! Program Stop Status
INTEGER, PARAMETER :: SPHERE_DRAG=1,CYLINDER_DRAG=2,USER_DRAG=3                             ! Options for drag computation
INTEGER, PARAMETER :: OLD=1,NEW=2,GUESS=3,PREVIOUS=4                                        ! Network solver indices

! Species components of the mixture fraction
INTEGER :: N_STATE_SPECIES=0
INTEGER :: FUEL_INDEX=0,O2_INDEX=0,N2_INDEX=0,H2O_INDEX=0,CO2_INDEX=0,CO_INDEX=0,H2_INDEX=0, &
           SOOT_INDEX=0,OTHER_INDEX=0                                                       ! Mixture Fraction Species
CHARACTER(20), DIMENSION(:), ALLOCATABLE :: MF_SPEC_ID,MF_SPEC_FORMULA
REAL(EB), DIMENSION(:), ALLOCATABLE :: MF_MW
REAL(EB) :: H_G_H2O_FAC=0._EB

! Program Status Code

INTEGER :: PROCESS_STOP_STATUS=NO_STOP

! Miscellaneous logical constants
 
LOGICAL :: LES,DNS,RADIATION,CONVECTION=.TRUE.,KAPPA_ARRAY=.FALSE.,CYLINDRICAL,NOISE,MIXTURE_FRACTION=.FALSE., &
           PREDICTOR,CORRECTOR,APPEND,DROPLET_FILE=.FALSE.,RESTART,SUPPRESSION=.TRUE.,SUPPRESSION_SEARCH=.TRUE., &
           CO_PRODUCTION=.FALSE.,SOOT_DEPOSITION=.FALSE.,ACCUMULATE_WATER=.FALSE.,RECOUNT_DRIP,WRITE_XYZ=.FALSE., &
           CHECK_POISSON,CHECK_VOLUME_FLOW=.FALSE.,TWO_D,SET_UP=.FALSE.,SMOKE3D, &
           STATUS_FILES=.FALSE.,DEBUG,SYNCHRONIZE,TIMING,LOCK_TIME_STEP=.FALSE.,RESTRICT_TIME_STEP=.TRUE.,  &
           FLUSH_FILE_BUFFERS, &
           COLUMN_DUMP_LIMIT,MASS_FILE=.FALSE.,STATE_FILE=.FALSE.,STRATIFICATION,SOLID_PHASE_ONLY, &
           AL2O3=.FALSE.,UL_PAN_DATA=.FALSE.,EDDY_DISSIPATION=.TRUE.,SHARED_FILE_SYSTEM=.TRUE., &
           FREEZE_VELOCITY=.FALSE.,BNDF_DEFAULT=.TRUE.,PARTICLE_CFL=.FALSE., &
           COMPUTE_VISCOSITY_TWICE=.TRUE., &
           CONSTANT_PROPERTIES=.FALSE.,DYNSMAG=.FALSE.,SPATIAL_GRAVITY_VARIATION=.FALSE., &
           CHECK_KINETIC_ENERGY=.FALSE.,PROJECTION=.FALSE.,CLIP_MASS_FRACTION=.FALSE.,STORE_MU_DNS=.FALSE.,CHECK_VN=.FALSE., &
           FDS6=.TRUE.,VIRTUAL_PARTICLES=.FALSE.,RAW_DATA_FILE=.FALSE.,HVAC=.FALSE., &
           H_EDDY=.FALSE.,H_LOGLAW=.FALSE.,H_CHILTON_COLBURN=.FALSE.,BAROCLINIC=.FALSE.,NOBIAS=.FALSE., &
           VAN_DRIEST=.FALSE.,EMBEDDED_MESH=.FALSE., &
           THERMOPHORETIC_DEPOSITION=.TRUE.,TURBULENT_DEPOSITION=.TRUE.,VELOCITY_ERROR_FILE=.FALSE.,OLD_PRESSURE_SCHEME=.FALSE., &
           CP_FTMP=.FALSE.,EXTINCTION2=.FALSE.,NEW_EVAP=.FALSE., &
           MEAN_FORCING(3)=.FALSE.,USE_MAX_FILTER_WIDTH=.FALSE.,CHECK_GR=.FALSE.,NEW_MIX_TIME=.FALSE., &
           NEW_PARTICLE_METHOD=.FALSE.,WFDS=.FALSE.,PATCH_VELOCITY=.FALSE.,OVERWRITE=.TRUE., &
           CHECK_CHEMICAL_TIME_SCALE=.FALSE.
           
LOGICAL, ALLOCATABLE, DIMENSION(:) :: SYNC_TIME_STEP,CHANGE_TIME_STEP

! Miscellaneous character strings

CHARACTER(10) :: SMOKE3D_COMPRESSION
CHARACTER(256) :: TITLE,RENDER_FILE,UVW_FILE='null'
CHARACTER(40) :: CHID,RESTART_CHID
CHARACTER(256) :: TERRAIN_IMAGE

! Dates, version numbers, revision numbers

CHARACTER(20) :: COMPILE_DATE='null',VERSION_STRING='null'
REAL(FB) :: VERSION_NUMBER=5.0
INTEGER :: SVN_REVISION_NUMBER=0
 
! Global EVACuation parameters

LOGICAL, ALLOCATABLE, DIMENSION(:) :: EVACUATION_ONLY, EVACUATION_GRID
REAL(EB) :: EVAC_DT_FLOWFIELD,EVAC_DT_STEADY_STATE,EVAC_DT,T_EVAC,T_EVAC_SAVE
INTEGER :: EVAC_PRESSURE_ITERATIONS,EVAC_TIME_ITERATIONS,EVAC_N_QUANTITIES,I_EVAC
INTEGER :: EVAC_AVATAR_NCOLOR
LOGICAL :: EVACUATION_MC_MODE=.FALSE.,EVACUATION_DRILL=.FALSE.,NO_EVACUATION=.FALSE.
CHARACTER(30), ALLOCATABLE, DIMENSION(:) :: EVAC_CLASS_NAME
INTEGER, ALLOCATABLE, DIMENSION(:) :: EVAC_QUANTITIES_INDEX
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: EVAC_CLASS_RGB,EVAC_AVATAR_RGB
REAL(EB), ALLOCATABLE, DIMENSION(:) :: EVACUATION_Z_OFFSET

! Miscellaneous real constants
 
REAL(EB) :: CPOPR,RSC,RPR,TMPA,TMPA4,TMPM,RHOA,P_INF,P_STP,GRAV,R0,R1, &
            CP_GAMMA,GAMMA,U0,V0,W0,H0,GVEC(3),FVEC(3)=0._EB,CSMAG, &
            LAPSE_RATE,HCH,HCV,TEX_ORI(3),SIGMA,KAPPA0,C_FORCED,C_FORCED_CYLINDER,C_FORCED_SPHERE, &
            ASSUMED_GAS_TEMPERATURE,PR_ONTH,MU_AIR_0,CP_AIR_0,PR_AIR,K_AIR_0, &
            CHARACTERISTIC_VELOCITY,CFL_MAX,CFL_MIN,VN_MAX,VN_MIN,PR,SC,C_P_W,H_V_W,SMOKE_ALBEDO,GROUND_LEVEL=0._EB, &
            PARTICLE_CFL_MAX=1.0_EB,LIMITING_DT_RATIO=1.E-4_EB,HRRPUVCUT_MAX=200._EB, &
            PRESSIT_RELAX_FACTOR=1._EB,PREDICTOR_RELAX_FACTOR=1._EB,CORRECTOR_RELAX_FACTOR=1._EB, &
            SCALAR_ENERGY_TOLERANCE=1.E-12_EB,TKE_TOLERANCE=1.E-6_EB,RFAC_FORCING(3)=0.5_EB, &
            TAU_CHEM=1.E-10_EB,TAU_FLAME=1.E10_EB
            
REAL(FB) :: HRRPUV_MAX_SMV=-1.0_FB
INTEGER :: USE_HRRPUV_MAX_SMV=0

! Parameters associated with parallel mode

INTEGER :: MYID=0,NUMPROCS=1,EVAC_PROCESS=-1
LOGICAL :: USE_MPI=.FALSE.
INTEGER, ALLOCATABLE, DIMENSION(:) :: PROCESS,FILE_COUNTER

! Time parameters

REAL(EB) :: T_BEGIN,T_END,TIME_SHRINK_FACTOR,RELAXATION_FACTOR
 
! Combustion parameters
 
REAL(EB), PARAMETER :: MW_O2=32._EB,MW_H2=2._EB,MW_CO2=44._EB,MW_H2O=18._EB,MW_N2=28._EB,MW_CO=28._EB, &
                       MW_C=12._EB,MW_H=1._EB,MW_O=16._EB,MW_N=14._EB, &
                       !HEAT_OF_FORMATION kJ/mol Drysdale, Fire Dynamics
                       CO_HEAT_OF_FORMATION = 110.523E3_EB, CO2_HEAT_OF_FORMATION = 393.513E3_EB, &
                       H2O_HEAT_OF_FORMATION = 241.826E3_EB
REAL(EB) :: Y_O2_INFTY = 0.232428_EB
REAL(EB) :: MW_AIR,MW_OTHER,MW_SOOT,HRRPUA_SHEET,RHO_SOOT,VISIBILITY_FACTOR, SOOT_H_FRACTION ,&
            MASS_EXTINCTION_COEFFICIENT,EC_LL,C_EDC=0.1_EB,BETA_EDC=1._EB,Y_P_MIN_EDC=0.0001_EB,HRRPUV_AVERAGE, &
            FIXED_MIX_TIME=-1._EB
INTEGER :: N_SPECIES=0,I_WATER,I_CO2,N_REACTIONS,I_FUEL,I_PROG_CO, I_PROG_F, I_PROG_SOOT, I_CO, I_O2,I_SOOT,I_Z_MIN,I_Z_MAX, &
           I_N2,I_H2,N_Y_ARRAY,N_KAPPA_ARRAY,N_MIX_SPECIES=0,N_REAC_SPECIES=0
REAL(EB) :: RSUM0
REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: Y2Y,Y2CP,Y2CPBAR,Y2D,Y2K,Y2MU,Y2H_G
REAL(EB), ALLOCATABLE, DIMENSION(:) :: Y2Y_C,Y2CP_C,Y2CPBAR_C,Y2D_C,Y2K_C,Y2MU_C,Y2H_G_C,MW_AVG_Y,Y_MF_SUM_Y,&
                                       Y2KAPPA_M4,RCON_MF
REAL(EB) :: MW_AVG_C,Y_MF_SUM_C,MW_AVG_Y_C,Y_MF_SUM_Y_C
INTEGER, ALLOCATABLE, DIMENSION(:) :: KAPPA_INDEX
REAL(EB), ALLOCATABLE, DIMENSION(:,:,:,:) :: Y2KAPPA
INTEGER :: Y2KAPPA_T,Y2KAPPA_M

! Radiation parameters

INTEGER :: NUMBER_SPECTRAL_BANDS,NUMBER_RADIATION_ANGLES,ANGLE_INCREMENT
CHARACTER(30) :: RADCAL_FUEL='METHANE'

! Ramping parameters
 
CHARACTER(30) :: RAMP_ID(1000),RAMP_TYPE(1000)
INTEGER :: I_RAMP_GX,I_RAMP_GY,I_RAMP_GZ,N_RAMP
INTEGER, PARAMETER :: TIME_HEAT=-1,TIME_VELO=-2,TIME_TEMP=-3,TIME_EFLUX=-4,TIME_PART=-5,TANH_RAMP=-2,TSQR_RAMP=-1

! TABLe parameters

CHARACTER(30) :: TABLE_ID(1000)
INTEGER :: N_TABLE=0,TABLE_TYPE(1000)
INTEGER, PARAMETER :: SPRAY_PATTERN=1

! Variables related to meshes

INTEGER :: NMESHES=1,IBAR_MAX=0,JBAR_MAX=0,KBAR_MAX=0,MESH_LIST_EMB(100)
REAL(EB) :: XS_MIN=1.E6_EB,XF_MAX=-1.E6_EB,YS_MIN=1.E6_EB,YF_MAX=-1.E6_EB,ZS_MIN=1.E6_EB,ZF_MAX=-1.E6_EB
CHARACTER(30), DIMENSION(:), ALLOCATABLE :: MESH_NAME
INTEGER, DIMENSION(:,:), ALLOCATABLE ::  I_MIN,I_MAX,J_MIN,J_MAX,K_MIN,K_MAX,NIC

! Variables related to pressure solver

LOGICAL :: ITERATE_PRESSURE=.FALSE.,PRESSIT_ACCELERATOR=.FALSE.
REAL(EB) :: VELOCITY_TOLERANCE=1.E6_EB,PRESSIT_SCALE_FACTOR=0.5_EB
REAL(EB), ALLOCATABLE, DIMENSION(:) :: VELOCITY_ERROR_MAX
INTEGER, ALLOCATABLE, DIMENSION(:) :: VELOCITY_ERROR_MAX_I,VELOCITY_ERROR_MAX_J,VELOCITY_ERROR_MAX_K
INTEGER :: PRESSURE_ITERATIONS=0,MAX_PRESSURE_ITERATIONS=10000
CHARACTER(10):: PRES_METHOD = 'FFT'

! Miscellaneous integer constants
 
INTEGER :: ICYC,WALL_INCREMENT,NFRAMES,PERIODIC_TEST=0,DSMAG_FREQ=1,DSMAG_INC=1,FISHPAK_BC(3)=-1,IUVW=1
 
! Clocks for output file dumps
 
REAL(EB), ALLOCATABLE, DIMENSION(:) :: PART_CLOCK,CORE_CLOCK,SLCF_CLOCK,SL3D_CLOCK, &
                                       PL3D_CLOCK,BNDF_CLOCK,ISOF_CLOCK,PROF_CLOCK
REAL(EB) :: MINT_CLOCK,DEVC_CLOCK,HRR_CLOCK,EVAC_CLOCK,CTRL_CLOCK,FLUSH_CLOCK
REAL(EB) :: DT_SLCF,DT_BNDF,DT_DEVC,DT_DEVC_LINE,DT_PL3D,DT_PART,DT_RESTART,DT_ISOF,DT_HRR,DT_MASS,DT_PROF,DT_CTRL,DT_FLUSH, &
            DT_SL3D
REAL(EB) :: DT_VEG,VEG_CLOCK
REAL(EB) :: UVW_CLOCK(4)=(/0._EB,0.28_EB,0.67_EB,1.E10_EB/)

! flag to output centrally average time for hrr and devc output file clocks

LOGICAL :: CENTERED_HRR_TIME, CENTERED_DEVC_TIME

! Miscellaneous mesh dimensions

REAL(EB) :: CHARACTERISTIC_CELL_SIZE
 
! Logical units and output file names
 
INTEGER                              :: LU_ERR=0,LU_END=2,LU_SMV=4,LU_INPUT=5,LU_OUTPUT=6
INTEGER                              :: LU_MASS,LU_HRR,LU_NOTREADY,LU_VELOCITY_ERROR,LU_LINE
INTEGER                              :: LU_EVACCSV,LU_EVACEFF,LU_EVACFED,LU_EVACOUT,LU_UL_PAN_DATA
INTEGER, ALLOCATABLE, DIMENSION(:)   :: LU_PART,LU_PROF,LU_XYZ,LU_PL3D,LU_DEVC,LU_STATE,LU_CTRL,LU_CORE,LU_RESTART
INTEGER, ALLOCATABLE, DIMENSION(:)   :: LU_VEG_OUT
INTEGER, ALLOCATABLE, DIMENSION(:,:) :: LU_SLCF,LU_BNDF,LU_ISOF,LU_SMOKE3D,LU_BNDF_SLCF
INTEGER                              :: DEVC_COLUMN_LIMIT=254,CTRL_COLUMN_LIMIT=254

CHARACTER(250)                             :: FN_INPUT='null'
CHARACTER(45)                              :: FN_STOP='null'
CHARACTER(80)                              :: FN_MASS,FN_HRR,FN_OUTPUT,FN_SMV,FN_END,FN_ERR,FN_NOTREADY,FN_VELOCITY_ERROR
CHARACTER(80)                              :: FN_EVACCSV,FN_EVACEFF,FN_EVACFED,FN_EVACOUT,FN_LINE
CHARACTER(80), ALLOCATABLE, DIMENSION(:)   :: FN_PART,FN_PROF,FN_XYZ,FN_PL3D,FN_DEVC,FN_STATE,FN_CTRL,FN_CORE,FN_RESTART
CHARACTER(80), ALLOCATABLE, DIMENSION(:)   :: FN_VEG_OUT
CHARACTER(80), ALLOCATABLE, DIMENSION(:,:) :: FN_SLCF,FN_BNDF,FN_ISOF,FN_SMOKE3D,FN_BNDF_SLCF
 
! Boundary condition arrays
 
CHARACTER(30) :: MATL_NAME(1:1000)
INTEGER :: N_SURF,N_SURF_RESERVED,N_MATL,MIRROR_SURF_INDEX,OPEN_SURF_INDEX,INTERPOLATED_SURF_INDEX,DEFAULT_SURF_INDEX=0, &
           INERT_SURF_INDEX=0,PERIODIC_SURF_INDEX,HVAC_SURF_INDEX=-1,EVACUATION_SURF_INDEX=-1
REAL(EB), ALLOCATABLE, DIMENSION(:) :: AAS,BBS,CCS,DDS,DDT,DX_S,RDX_S,RDXN_S,DX_WGT_S, &
                                       K_S,RHOCBAR,C_S,RHO_S,Q_S,KAPPA_S,X_S_NEW,R_S,MF_FRAC
INTEGER,  ALLOCATABLE, DIMENSION(:) :: LAYER_INDEX

! Divergence Arrays

REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: DSUM,USUM,PSUM,ACTUAL_LEAK_AREA
REAL(EB), ALLOCATABLE, DIMENSION(:,:,:) :: ASUM,FDS_LEAK_AREA,FDS_LEAK_AREA_RATIO

! Raised vegetation arrays
 
INTEGER :: N_TREES,N_TREES_OUT
REAL(EB), ALLOCATABLE, DIMENSION(:) :: CROWN_W,CROWN_W_BOTTOM,CROWN_W_TOP,CROWN_B_H, TREE_H,X_TREE,Y_TREE,Z_TREE
INTEGER,  ALLOCATABLE, DIMENSION(:) :: TREE_PARTICLE_CLASS
REAL(EB), ALLOCATABLE, DIMENSION(:) :: XS_RECT_VEG,XF_RECT_VEG,YS_RECT_VEG,YF_RECT_VEG, &
                                       ZS_RECT_VEG,ZF_RECT_VEG
CHARACTER(30),ALLOCATABLE, DIMENSION(:) :: VEG_FUEL_GEOM, VEG_LABELS
REAL(EB),ALLOCATABLE, DIMENSION(:) :: RING_THICKNESS_VEG,TON_IGN_ELEMS,TOFF_IGN_ELEMS, &
                                      T_RAMPOFF_IGN_ELEMS,T_RAMPON_IGN_ELEMS
LOGICAL, ALLOCATABLE, DIMENSION(:) :: IGN_ELEM,TREE_MESH,TREE_MESH_OUT
INTEGER, ALLOCATABLE, DIMENSION(:) :: N_TREE_OUT
REAL(EB),ALLOCATABLE, DIMENSION(:) :: VEG_TOTAL_DRY_MASS,VEG_TOTAL_MOIST_MASS
REAL(EB),ALLOCATABLE, DIMENSION(:,:,:) :: TREE_OUTPUT_DATA
REAL(EB),ALLOCATABLE, DIMENSION(:,:) :: TREE_OUTPUT_DATA_TOTAL
LOGICAL :: TREE_CASE=.FALSE.

! Level Set vegetation fire spread

INTEGER  :: LIMITER_LS,NX_LS,NY_LS
REAL(EB) :: DT_LS,DX_LS,DY_LS,PHI_MIN_LS,PHI_MAX_LS,ROS_0,ROS_HEADS,ROS_BACKS, &
            TIME_FLANKFIRE_QUENCH,TIME_LS
LOGICAL  :: RK2_PREDICTOR_LS,VEG_LEVEL_SET
REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: FLUX0_LS,FLUX1_LS,PHI_LS,PHI0_LS,PHI1_LS,ROS_BACKU, &
                                         ROS_HEAD,ROS_HEAD_U0_INFW,ROS_HEAD_U_INFW,ROS_FLANK, &
                                         SR_X_LS,SR_Y_LS,U_LS,V_LS,Z_LS,DZTDX,DZTDY,MAG_ZT, &
                                         FLANKFIRE_LIFETIME,WIND_EXP

! Terrain parameters

LOGICAL :: TERRAIN_CASE=.FALSE.,WIND_ONLY=.FALSE.

! Sprinkler Variables
 
REAL(EB) :: C_DIMARZO=6.E6_EB
INTEGER :: NSTRATA,N_ACTUATED_SPRINKLERS=0,N_OPEN_NOZZLES=0
INTEGER, PARAMETER :: NDC=1000
LOGICAL :: POROUS_FLOOR=.TRUE.,ALLOW_UNDERSIDE_DROPLETS=.FALSE.,ALLOW_SURFACE_DROPLETS=.TRUE.

! Particles and Droplets
 
INTEGER :: MAXIMUM_DROPLETS,N_PART,PARTICLE_TAG,N_EVAC,N_EVAP_INDICES=0,WATER_PART_INDEX=0
REAL(EB) :: RUN_AVG_FAC
 
! Number of initial value, pressure zone, and multiplier derived types
 
INTEGER :: N_INIT,N_ZONE,N_MULT 
LOGICAL, ALLOCATABLE, DIMENSION(:,:,:) :: CONNECTED_ZONES
REAL(EB) :: PRESSURE_RELAX_FACTOR=0.2_EB

! Output quantity arrays
 
INTEGER, PARAMETER :: N_OUTPUT_QUANTITIES=350
INTEGER :: PLOT3D_QUANTITY_INDEX(5),PLOT3D_SPEC_INDEX(5)=0,PLOT3D_PART_INDEX(5),SMOKE3D_QUANTITY_INDEX,SMOKE3D_SPEC_INDEX=0, &
           PLOT3D_VELO_INDEX(5)=0
CHARACTER(30) :: PLOT3D_QUANTITY(5),PLOT3D_SPEC_ID(5),PLOT3D_PART_ID(5),PLOT3D_SMOKEVIEW_BAR_LABEL(5), &
                 SMOKE3D_QUANTITY,SMOKE3D_SPEC_ID,SMOKE3D_SMOKEVIEW_BAR_LABEL
CHARACTER(60) :: PLOT3D_SMOKEVIEW_LABEL(5),SMOKE3D_SMOKEVIEW_LABEL
INTEGER :: N_BNDF,N_ISOF,N_PROF,N_SLCF_MAX=0
REAL(EB),ALLOCATABLE, DIMENSION(:) :: HRR,RHRR,CHRR,FHRR,FUEL_DROPLET_MLR,MLR, &
                                      HRR_SUM,RHRR_SUM,CHRR_SUM,FHRR_SUM,MLR_SUM,HRR_TIME_INTERVAL
REAL(EB),ALLOCATABLE, DIMENSION(:,:) :: MINT,MINT_SUM
REAL(EB),ALLOCATABLE, DIMENSION(:) :: MINT_TIME_INTERVAL

! Clipping values
 
REAL(EB) :: TMPMIN,TMPMAX,YYMIN(MAX_SPECIES),YYMAX(MAX_SPECIES),RHOMIN,RHOMAX

! Flux limiter (experimental)

INTEGER :: FLUX_LIMITER=-1,CFL_VELOCITY_NORM=0
 
! CPU and Wall Clock Timings
 
INTEGER, PARAMETER :: N_TIMERS_FDS=11,N_TIMERS_EVAC=15,N_TIMERS_DIM=21,N_TIMERS_HVAC=16
REAL(EB), ALLOCATABLE, DIMENSION(:,:) :: TUSED
INTEGER, ALLOCATABLE, DIMENSION(:) :: NTCYC,NCYC
REAL(EB), ALLOCATABLE, DIMENSION(:) :: T_PER_STEP,T_ACCUM
REAL(EB) :: WALL_CLOCK_START, WALL_CLOCK_END, WALL_CLOCK_START_ITERATIONS

! OpenMP Specifications

INTEGER :: OPENMP_AVAILABLE_THREADS=0
LOGICAL :: USE_OPENMP=.FALSE., DEBUG_OPENMP=.FALSE.

! Complex geometry (experimental)

INTEGER :: IMMERSED_BOUNDARY_METHOD=-1,N_GEOM=0
INTEGER, PARAMETER :: IBOX=1,ISPHERE=2,ICYLINDER=3,IPLANE=4
REAL(EB) :: IBM_UVWMAX = 0._EB

! HVAC Parameters

INTEGER :: N_DUCTNODES = 0, N_DUCTS = 0, N_FANS = 0, N_FILTERS = 0, N_AIRCOILS = 0,N_NETWORKS=0
INTEGER , ALLOCATABLE, DIMENSION(:) :: DUCT_NE,DUCTNODE_NE
LOGICAL :: HVAC_SOLVE=.FALSE.

CONTAINS

SUBROUTINE GET_REV_cons(MODULE_REV,MODULE_DATE)
INTEGER,INTENT(INOUT) :: MODULE_REV
CHARACTER(255),INTENT(INOUT) :: MODULE_DATE

WRITE(MODULE_DATE,'(A)') consrev(INDEX(consrev,':')+1:LEN_TRIM(consrev)-2)
READ (MODULE_DATE,'(I5)') MODULE_REV
WRITE(MODULE_DATE,'(A)') consdate

END SUBROUTINE GET_REV_cons
 
END MODULE GLOBAL_CONSTANTS
