(*
 *
 * File: nivel1.st
 *
 * IEC 61131-3 Structured Text (ST) code generated for subsystem "nivel1/NIVEL 1"
 *
 * Model name                      : nivel1
 * Model version                   : 1.1
 * Model creator                   : GoniR
 * Model last modified by          : GoniR
 * Model last modified on          : Mon Jan 03 21:05:33 2022
 * Model sample time               : 0s
 * Subsystem name                  : nivel1/NIVEL 1
 * Subsystem sample time           : 0.2s
 * Simulink PLC Coder version      : 3.3 (R2020b) 29-Jul-2020
 * ST code generated on            : Mon Jan 03 21:48:30 2022
 *
 * Target IDE selection            : 3S CoDeSys 3.5
 * Test Bench included             : No
 *
 *)
FUNCTION_BLOCK NIVEL
VAR_INPUT
    ssMethodType: SINT;
    X_com: LREAL;
    Y_com: LREAL;
    yef: LREAL;
    xef: LREAL;
    cD: LREAL;
    cS: LREAL;
    sCarga: LREAL;
    cAng: LREAL;
    xl: LREAL;
    Parada: LREAL;
    b_time: LREAL;
    yl: LREAL;
    modo: LREAL;
    theta: LREAL;
    vel_Izmax: LREAL;
    Se1: LREAL;
    posF_flag: LREAL;
END_VAR
VAR_OUTPUT
    vx: LREAL;
    vy: LREAL;
    velmY: LREAL;
    velmX: LREAL;
    ysf: LREAL;
    ysi: LREAL;
    xsi: LREAL;
    xsf: LREAL;
    modo_de_control: LREAL;
    modo_op: LREAL;
    flag_disDesP: LREAL;
END_VAR
VAR
    is_active_c1_NIVEL: USINT;
    is_Spreder: USINT;
    is_controlAngulo: USINT;
    is_modoOperacion: USINT;
    time_a: LREAL;
    is_Automatico: USINT;
    error: LREAL;
    dist_desp: LREAL;
    vx_a: LREAL;
    vy_a: LREAL;
    Scargado: LREAL;
    flagcD: LREAL;
    is_CicloDoble: USINT;
    is_CicloSimple: USINT;
    cont: LREAL;
    i0_Calc_v1: Calc_v1;
    i0_Calc_v: Calc_v;
END_VAR
VAR_TEMP
    sf_internal_predicateOutput: BOOL;
    temp1: BOOL;
END_VAR
CASE ssMethodType OF
    SS_INITIALIZE: 
        (* SystemInitialize for Chart: '<Root>/NIVEL 1' *)
        is_Spreder := NIVEL_IN_NO_ACTIVE_CHILD;
        is_controlAngulo := NIVEL_IN_NO_ACTIVE_CHILD;
        is_modoOperacion := NIVEL_IN_NO_ACTIVE_CHILD;
        is_Automatico := NIVEL_IN_NO_ACTIVE_CHILD;
        is_CicloDoble := NIVEL_IN_NO_ACTIVE_CHILD;
        is_CicloSimple := NIVEL_IN_NO_ACTIVE_CHILD;
        is_active_c1_NIVEL := 0;
        cont := 0.0;
        flagcD := 0.0;
    SS_STEP: 
        (* Chart: '<Root>/NIVEL 1' incorporates:
         *  Outport: '<Root>/flag_disDesP'
         *  Outport: '<Root>/modo_de_control'
         *  Outport: '<Root>/modo_op'
         *  Outport: '<Root>/velmX'
         *  Outport: '<Root>/velmY'
         *  Outport: '<Root>/vx'
         *  Outport: '<Root>/vy'
         *  Outport: '<Root>/xsf'
         *  Outport: '<Root>/xsi'
         *  Outport: '<Root>/ysf'
         *  Outport: '<Root>/ysi' *)
        (* Gateway: NIVEL 1 *)
        (* During: NIVEL 1 *)
        IF is_active_c1_NIVEL = 0 THEN 
            (* Entry: NIVEL 1 *)
            is_active_c1_NIVEL := 1;
            (* Entry Internal: NIVEL 1 *)
            (* Transition: '<S1>:16' *)
            (* Entry Internal 'Nivel1': '<S1>:14' *)
            (* Entry Internal 'Spreder': '<S1>:13' *)
            (* Transition: '<S1>:24' *)
            is_Spreder := NIVEL_IN_Descargado;
            (* Entry 'Descargado': '<S1>:23' *)
            (* '<S1>:23:3' Scargado=0 *)
            Scargado := 0.0;
            (* Entry Internal 'controlAngulo': '<S1>:12' *)
            (* Transition: '<S1>:29' *)
            is_controlAngulo := NIVEL_IN_Activado;
            (* Entry Internal 'modoOperacion': '<S1>:3' *)
            (* Transition: '<S1>:6' *)
            is_modoOperacion := NIVEL_IN_modoManual;
            (* Entry 'modoManual': '<S1>:5' *)
            (* '<S1>:5:3' modo_op = 0; *)
            modo_op := 0.0;
            (* '<S1>:5:4' xsi=xCarro_pos; *)
            xsi := xl;
            (* '<S1>:5:5' ysi=yCarro_pos; *)
            ysi := yl;
            (* '<S1>:5:6' vx=0; *)
            vx := 0.0;
            (* '<S1>:5:7' vy=0; *)
            vy := 0.0;
            (* '<S1>:5:8' time_a=time; *)
            time_a := b_time;
            (* '<S1>:5:9' vx_a=0; *)
            vx_a := 0.0;
            (* '<S1>:5:10' vy_a=0; *)
            vy_a := 0.0;
            (* '<S1>:5:11' error=0; *)
            error := 0.0;
            (* '<S1>:5:12' delta_t=0; *)
            (* '<S1>:5:13' modo_de_control=0; *)
            modo_de_control := 0.0;
            (* '<S1>:5:14' dist_desp=yCarro_pos-20; *)
            dist_desp := yl - 20.0;
            (* '<S1>:5:15' if(dist_desp>2) *)
            IF dist_desp > 2.0 THEN 
                (* '<S1>:5:16' flag_disDesP=1; *)
                flag_disDesP := 1.0;
            ELSE 
                (* '<S1>:5:17' else *)
                (* '<S1>:5:18' flag_disDesP=0; *)
                flag_disDesP := 0.0;
            END_IF;
        ELSE 
            (* During 'Nivel1': '<S1>:14' *)
            (* During 'Spreder': '<S1>:13' *)
            CASE is_Spreder OF
                NIVEL_IN_Cargado: 
                    (* During 'Cargado': '<S1>:25' *)
                    (* '<S1>:27:1' sf_internal_predicateOutput = sCarga==0; *)
                    IF sCarga = 0.0 THEN 
                        (* Transition: '<S1>:27' *)
                        is_Spreder := NIVEL_IN_Descargado;
                        (* Entry 'Descargado': '<S1>:23' *)
                        (* '<S1>:23:3' Scargado=0 *)
                        Scargado := 0.0;
                    END_IF;
                ELSE
                    (* During 'Descargado': '<S1>:23' *)
                    (* '<S1>:26:1' sf_internal_predicateOutput = sCarga==1; *)
                    IF sCarga = 1.0 THEN 
                        (* Transition: '<S1>:26' *)
                        is_Spreder := NIVEL_IN_Cargado;
                        (* Entry 'Cargado': '<S1>:25' *)
                        (* '<S1>:25:3' Scargado=1 *)
                        Scargado := 1.0;
                    END_IF;
            END_CASE;
            (* During 'controlAngulo': '<S1>:12' *)
            CASE is_controlAngulo OF
                NIVEL_IN_Activado: 
                    (* During 'Activado': '<S1>:28' *)
                    (* '<S1>:31:1' sf_internal_predicateOutput = cAng==0; *)
                    IF cAng = 0.0 THEN 
                        (* Transition: '<S1>:31' *)
                        is_controlAngulo := NIVEL_IN_Desactivado;
                    END_IF;
                ELSE
                    (* During 'Desactivado': '<S1>:30' *)
                    (* '<S1>:32:1' sf_internal_predicateOutput = cAng==1; *)
                    IF cAng = 1.0 THEN 
                        (* Transition: '<S1>:32' *)
                        is_controlAngulo := NIVEL_IN_Activado;
                    END_IF;
            END_CASE;
            (* During 'modoOperacion': '<S1>:3' *)
            CASE is_modoOperacion OF
                NIVEL_IN_Automatico: 
                    (* During 'Automatico': '<S1>:18' *)
                    (* '<S1>:51:1' sf_internal_predicateOutput = error<2 && theta <0.05 || modo==109; *)
                    IF ((error < 2.0) AND (theta < 0.05)) OR (modo = 109.0) THEN 
                        sf_internal_predicateOutput := TRUE;
                    ELSE 
                        sf_internal_predicateOutput := FALSE;
                    END_IF;
                    IF sf_internal_predicateOutput OR (Se1 <> 0.0) THEN 
                        (* Transition: '<S1>:51' *)
                        (* Transition: '<S1>:193' *)
                        (* Exit Internal 'Automatico': '<S1>:18' *)
                        (* Exit Internal 'CicloDoble': '<S1>:21' *)
                        is_CicloDoble := NIVEL_IN_NO_ACTIVE_CHILD;
                        (* Exit Internal 'CicloSimple': '<S1>:19' *)
                        is_CicloSimple := NIVEL_IN_NO_ACTIVE_CHILD;
                        is_Automatico := NIVEL_IN_NO_ACTIVE_CHILD;
                        is_modoOperacion := NIVEL_IN_transicion1;
                        (* Entry 'transicion1': '<S1>:160' *)
                        (* '<S1>:160:3' time_a=time *)
                        time_a := b_time;
                        (* '<S1>:160:4' delta_t=0 *)
                    ELSE 
                        (* '<S1>:193:1' sf_internal_predicateOutput = flag_emergencia; *)
                        CASE is_Automatico OF
                            NIVEL_IN_CicloDoble: 
                                (* During 'CicloDoble': '<S1>:21' *)
                                (* '<S1>:113:1' sf_internal_predicateOutput = Parada==112; *)
                                IF Parada = 112.0 THEN 
                                    (* Transition: '<S1>:113' *)
                                    (* Exit Internal 'CicloDoble': '<S1>:21' *)
                                    is_CicloDoble := NIVEL_IN_NO_ACTIVE_CHILD;
                                    is_Automatico := NIVEL_IN_standby;
                                    (* Entry 'standby': '<S1>:73' *)
                                    (* '<S1>:73:3' error=inf; *)
                                    error := 1.797693134862316E+307;
                                    (* '<S1>:73:4' modo_op = 1; *)
                                    modo_op := 1.0;
                                ELSE 
                                    CASE is_CicloDoble OF
                                        NIVEL_IN_cargaBarco: 
                                            velmX := 4.0;
                                            modo_de_control := 1.0;
                                            (* During 'cargaBarco': '<S1>:96' *)
                                            (* '<S1>:96:13' error=Calc_error(xsf,xCarro_pos,ysf,yCarro_pos); *)
                                            error := Calc_error(xf := xsf, xpos := xl, yf := ysf, ypos := yl);
                                        NIVEL_IN_descaragBarco: 
                                            velmX := 4.0;
                                            modo_de_control := 1.0;
                                            (* During 'descaragBarco': '<S1>:97' *)
                                            (* '<S1>:97:13' error=Calc_error(xsf,xCarro_pos,ysf,yCarro_pos); *)
                                            error := Calc_error(xf := xsf, xpos := xl, yf := ysf, ypos := yl);
                                        ELSE
                                            modo_op := 3.0;
                                            (* During 'standby': '<S1>:100' *)
                                            (* '<S1>:101:1' sf_internal_predicateOutput = xCarro_pos<30; *)
                                            IF xl < 30.0 THEN 
                                                (* Transition: '<S1>:101' *)
                                                is_CicloDoble := NIVEL_IN_cargaBarco;
                                                (* Entry 'cargaBarco': '<S1>:96' *)
                                                (* '<S1>:96:3' xsi=xCarro_pos; *)
                                                xsi := xl;
                                                (* '<S1>:96:4' ysi=yCarro_pos; *)
                                                ysi := yl;
                                                (* '<S1>:96:5' xsf=xef; *)
                                                xsf := xef;
                                                (* '<S1>:96:6' ysf=yef; *)
                                                ysf := yef;
                                                (* '<S1>:96:7' velmX=4; *)
                                                velmX := 4.0;
                                                (* '<S1>:96:8' velmY=vel_Izmax; *)
                                                velmY := vel_Izmax;
                                                (* '<S1>:96:9' error=inf; *)
                                                error := 1.797693134862316E+307;
                                                (* '<S1>:96:10' modo_de_control=1; *)
                                                modo_de_control := 1.0;
                                                (* '<S1>:96:11' flagD_cB=1; *)
                                            ELSE 
                                                (* '<S1>:102:1' sf_internal_predicateOutput = xCarro_pos>30; *)
                                                IF xl > 30.0 THEN 
                                                    (* Transition: '<S1>:102' *)
                                                    is_CicloDoble := NIVEL_IN_descaragBarco;
                                                    (* Entry 'descaragBarco': '<S1>:97' *)
                                                    (* '<S1>:97:3' xsi=xCarro_pos; *)
                                                    xsi := xl;
                                                    (* '<S1>:97:4' ysi=yCarro_pos; *)
                                                    ysi := yl;
                                                    (* '<S1>:97:5' xsf=xef; *)
                                                    xsf := xef;
                                                    (* '<S1>:97:6' ysf=yef; *)
                                                    ysf := yef;
                                                    (* '<S1>:97:7' velmX=4; *)
                                                    velmX := 4.0;
                                                    (* '<S1>:97:8' velmY=vel_Izmax; *)
                                                    velmY := vel_Izmax;
                                                    (* '<S1>:97:9' error=inf; *)
                                                    error := 1.797693134862316E+307;
                                                    (* '<S1>:97:10' modo_de_control=1; *)
                                                    modo_de_control := 1.0;
                                                    (* '<S1>:97:11' flagD_cB=0; *)
                                                END_IF;
                                            END_IF;
                                    END_CASE;
                                END_IF;
                            NIVEL_IN_CicloSimple: 
                                (* During 'CicloSimple': '<S1>:19' *)
                                (* '<S1>:112:1' sf_internal_predicateOutput = Parada==112; *)
                                IF Parada = 112.0 THEN 
                                    (* Transition: '<S1>:112' *)
                                    (* Exit Internal 'CicloSimple': '<S1>:19' *)
                                    is_CicloSimple := NIVEL_IN_NO_ACTIVE_CHILD;
                                    is_Automatico := NIVEL_IN_standby;
                                    (* Entry 'standby': '<S1>:73' *)
                                    (* '<S1>:73:3' error=inf; *)
                                    error := 1.797693134862316E+307;
                                    (* '<S1>:73:4' modo_op = 1; *)
                                    modo_op := 1.0;
                                ELSE 
                                    CASE is_CicloSimple OF
                                        NIVEL_IN_cargaBarco: 
                                            velmX := 4.0;
                                            modo_de_control := 1.0;
                                            (* During 'cargaBarco': '<S1>:33' *)
                                            (* '<S1>:33:11' error=Calc_error(xsf,xCarro_pos,ysf,yCarro_pos); *)
                                            error := Calc_error(xf := xsf, xpos := xl, yf := ysf, ypos := yl);
                                        NIVEL_IN_descaragBarco: 
                                            velmX := 4.0;
                                            modo_de_control := 1.0;
                                            (* During 'descaragBarco': '<S1>:35' *)
                                            (* '<S1>:35:11' error=Calc_error(xsf,xCarro_pos,ysf,yCarro_pos); *)
                                            error := Calc_error(xf := xsf, xpos := xl, yf := ysf, ypos := yl);
                                        NIVEL_IN_idaBarco: 
                                            velmX := 4.0;
                                            modo_de_control := 1.0;
                                            (* During 'idaBarco': '<S1>:55' *)
                                            (* '<S1>:55:11' error=Calc_error(xsf,xCarro_pos,ysf,yCarro_pos); *)
                                            error := Calc_error(xf := xsf, xpos := xl, yf := ysf, ypos := yl);
                                        NIVEL_IN_standby_n: 
                                            modo_op := 2.0;
                                            (* During 'standby': '<S1>:56' *)
                                            (* '<S1>:59:1' sf_internal_predicateOutput = Scargado==1 && xCarro_pos<30; *)
                                            IF (Scargado = 1.0) AND (xl < 30.0) THEN 
                                                (* Transition: '<S1>:59' *)
                                                is_CicloSimple := NIVEL_IN_cargaBarco;
                                                (* Entry 'cargaBarco': '<S1>:33' *)
                                                (* '<S1>:33:3' xsi=xCarro_pos; *)
                                                xsi := xl;
                                                (* '<S1>:33:4' ysi=yCarro_pos; *)
                                                ysi := yl;
                                                (* '<S1>:33:5' xsf=xef; *)
                                                xsf := xef;
                                                (* '<S1>:33:6' ysf=yef; *)
                                                ysf := yef;
                                                (* '<S1>:33:7' velmX=4; *)
                                                velmX := 4.0;
                                                (* '<S1>:33:8' velmY=vel_Izmax; *)
                                                velmY := vel_Izmax;
                                                (* '<S1>:33:9' modo_de_control=1; *)
                                                modo_de_control := 1.0;
                                            ELSE 
                                                (* '<S1>:60:1' sf_internal_predicateOutput = Scargado==1 && xCarro_pos>30; *)
                                                IF (Scargado = 1.0) AND (xl > 30.0) THEN 
                                                    (* Transition: '<S1>:60' *)
                                                    is_CicloSimple := NIVEL_IN_descaragBarco;
                                                    (* Entry 'descaragBarco': '<S1>:35' *)
                                                    (* '<S1>:35:3' xsi=xCarro_pos; *)
                                                    xsi := xl;
                                                    (* '<S1>:35:4' ysi=yCarro_pos; *)
                                                    ysi := yl;
                                                    (* '<S1>:35:5' xsf=xef; *)
                                                    xsf := xef;
                                                    (* '<S1>:35:6' ysf=yef; *)
                                                    ysf := yef;
                                                    (* '<S1>:35:7' velmX=4; *)
                                                    velmX := 4.0;
                                                    (* '<S1>:35:8' velmY=vel_Izmax *)
                                                    velmY := vel_Izmax;
                                                    (* '<S1>:35:9' modo_de_control=1 *)
                                                    modo_de_control := 1.0;
                                                ELSE 
                                                    (* '<S1>:69:1' sf_internal_predicateOutput = Scargado==0 && xCarro_pos>30; *)
                                                    IF (Scargado = 0.0) AND (xl > 30.0) THEN 
                                                        (* Transition: '<S1>:69' *)
                                                        is_CicloSimple := NIVEL_IN_vueltaMuelle;
                                                        (* Entry 'vueltaMuelle': '<S1>:54' *)
                                                        (* '<S1>:54:3' xsi=xCarro_pos *)
                                                        xsi := xl;
                                                        (* '<S1>:54:4' ysi=yCarro_pos *)
                                                        ysi := yl;
                                                        (* '<S1>:54:5' xsf=xef *)
                                                        xsf := xef;
                                                        (* '<S1>:54:6' ysf=yef *)
                                                        ysf := yef;
                                                        (* '<S1>:54:7' velmX=4 *)
                                                        velmX := 4.0;
                                                        (* '<S1>:54:8' velmY=vel_Izmax *)
                                                        velmY := vel_Izmax;
                                                        (* '<S1>:54:9' modo_de_control=1 *)
                                                        modo_de_control := 1.0;
                                                    ELSE 
                                                        (* '<S1>:72:1' sf_internal_predicateOutput = Scargado==0 && xCarro_pos<30; *)
                                                        IF (Scargado = 0.0) AND (xl < 30.0) THEN 
                                                            (* Transition: '<S1>:72' *)
                                                            is_CicloSimple := NIVEL_IN_idaBarco;
                                                            (* Entry 'idaBarco': '<S1>:55' *)
                                                            (* '<S1>:55:3' xsi=xCarro_pos; *)
                                                            xsi := xl;
                                                            (* '<S1>:55:4' ysi=yCarro_pos; *)
                                                            ysi := yl;
                                                            (* '<S1>:55:5' xsf=xef; *)
                                                            xsf := xef;
                                                            (* '<S1>:55:6' ysf=yef; *)
                                                            ysf := yef;
                                                            (* '<S1>:55:7' velmX=4; *)
                                                            velmX := 4.0;
                                                            (* '<S1>:55:8' velmY=vel_Izmax; *)
                                                            velmY := vel_Izmax;
                                                            (* '<S1>:55:9' modo_de_control=1; *)
                                                            modo_de_control := 1.0;
                                                        END_IF;
                                                    END_IF;
                                                END_IF;
                                            END_IF;
                                        ELSE
                                            velmX := 4.0;
                                            modo_de_control := 1.0;
                                            (* During 'vueltaMuelle': '<S1>:54' *)
                                            (* '<S1>:54:11' error=Calc_error(xsf,xCarro_pos,ysf,yCarro_pos); *)
                                            error := Calc_error(xf := xsf, xpos := xl, yf := ysf, ypos := yl);
                                    END_CASE;
                                END_IF;
                            ELSE
                                modo_op := 1.0;
                                (* During 'standby': '<S1>:73' *)
                                (* '<S1>:74:1' sf_internal_predicateOutput = cS==115 && posF_flag; *)
                                IF (cS = 115.0) AND (posF_flag <> 0.0) THEN 
                                    (* Transition: '<S1>:74' *)
                                    is_Automatico := NIVEL_IN_CicloSimple;
                                    (* Entry Internal 'CicloSimple': '<S1>:19' *)
                                    (* Transition: '<S1>:58' *)
                                    is_CicloSimple := NIVEL_IN_standby_n;
                                    (* Entry 'standby': '<S1>:56' *)
                                    (* '<S1>:56:3' modo_op = 2; *)
                                    modo_op := 2.0;
                                ELSE 
                                    (* '<S1>:75:1' sf_internal_predicateOutput = (cD==100 && posF_flag)|| flagcD; *)
                                    IF ((cD = 100.0) AND (posF_flag <> 0.0)) OR (flagcD <> 0.0) THEN 
                                        (* Transition: '<S1>:75' *)
                                        is_Automatico := NIVEL_IN_CicloDoble;
                                        (* Entry Internal 'CicloDoble': '<S1>:21' *)
                                        (* Transition: '<S1>:104' *)
                                        is_CicloDoble := NIVEL_IN_standby;
                                        (* Entry 'standby': '<S1>:100' *)
                                        (* '<S1>:100:3' modo_op = 3; *)
                                        modo_op := 3.0;
                                        (* '<S1>:100:4' flagcD=1; *)
                                        flagcD := 1.0;
                                        (* '<S1>:100:5' cont=cont+1; *)
                                        cont := cont + 1.0;
                                        (* '<S1>:100:6' if(cont==2) *)
                                        IF cont = 2.0 THEN 
                                            (* '<S1>:100:7' flagcD=0; *)
                                            flagcD := 0.0;
                                            (* '<S1>:100:8' cont=0; *)
                                            cont := 0.0;
                                        END_IF;
                                    END_IF;
                                END_IF;
                        END_CASE;
                    END_IF;
                NIVEL_IN_modoManual: 
                    modo_op := 0.0;
                    modo_de_control := 0.0;
                    (* During 'modoManual': '<S1>:5' *)
                    (* '<S1>:50:1' sf_internal_predicateOutput = modo==97 && (dist_desp>2 || xCarro_pos>30); *)
                    IF (modo = 97.0) AND ((dist_desp > 2.0) OR (xl > 30.0)) THEN 
                        (* Transition: '<S1>:50' *)
                        is_modoOperacion := NIVEL_IN_transicion;
                        (* Entry 'transicion': '<S1>:158' *)
                        (* '<S1>:158:3' time_a=time; *)
                        time_a := b_time;
                        (* '<S1>:158:4' delta_t=0; *)
                    ELSE 
                        (* '<S1>:5:21' delta_t=time-time_a; *)
                        (* '<S1>:5:22' [vx,vy]=Calc_v(delta_t,vx_a,vy_a,X_com,Y_com); *)
                        i0_Calc_v(delta_t1 := b_time - time_a, vx_a1 := vx_a, vy_a1 := vy_a, X_com1 := X_com, Y_com1 := Y_com);
                        vx := i0_Calc_v.vx1;
                        vy := i0_Calc_v.vy1;
                        (* '<S1>:5:23' time_a=time; *)
                        time_a := b_time;
                        (* '<S1>:5:24' vx_a=vx; *)
                        vx_a := vx;
                        (* '<S1>:5:25' vy_a=vy; *)
                        vy_a := vy;
                    END_IF;
                NIVEL_IN_transicion: 
                    (* During 'transicion': '<S1>:158' *)
                    (* '<S1>:159:1' sf_internal_predicateOutput = abs(vx)<0.1 && abs(vy)<0.01; *)
                    temp1 := FALSE;
                    IF ABS(vx) < 0.1 THEN 
                        IF ABS(vy) < 0.01 THEN 
                            (* Transition: '<S1>:159' *)
                            (* Exit 'transicion': '<S1>:158' *)
                            (* '<S1>:158:10' vx = 0; *)
                            vx := 0.0;
                            (* '<S1>:158:11' vy = 0; *)
                            vy := 0.0;
                            is_modoOperacion := NIVEL_IN_Automatico;
                            (* Entry Internal 'Automatico': '<S1>:18' *)
                            (* Transition: '<S1>:77' *)
                            is_Automatico := NIVEL_IN_standby;
                            (* Entry 'standby': '<S1>:73' *)
                            (* '<S1>:73:3' error=inf; *)
                            error := 1.797693134862316E+307;
                            (* '<S1>:73:4' modo_op = 1; *)
                            modo_op := 1.0;
                        ELSE 
                            temp1 := TRUE;
                        END_IF;
                    ELSE 
                        temp1 := TRUE;
                    END_IF;
                    IF temp1 THEN 
                        (* Outport: '<Root>/vy' *)
                        (* '<S1>:158:6' delta_t=time-time_a; *)
                        (* '<S1>:158:7' [vx,vy]=Calc_v1(delta_t,vx,vy); *)
                        i0_Calc_v1(delta_t2 := b_time - time_a, vx_a2 := vx, vy_a2 := vy);
                        vx := i0_Calc_v1.vx2;
                        vy := i0_Calc_v1.vy2;
                        (* '<S1>:158:8' time_a=time; *)
                        time_a := b_time;
                    END_IF;
                ELSE
                    (* During 'transicion1': '<S1>:160' *)
                    (* '<S1>:161:1' sf_internal_predicateOutput = abs(vx)<0.1 && abs(vy)<0.01; *)
                    temp1 := FALSE;
                    IF ABS(vx) < 0.1 THEN 
                        IF ABS(vy) < 0.01 THEN 
                            (* Transition: '<S1>:161' *)
                            (* Exit 'transicion1': '<S1>:160' *)
                            (* '<S1>:160:10' vx = 0 *)
                            (* '<S1>:160:11' vy = 0 *)
                            is_modoOperacion := NIVEL_IN_modoManual;
                            (* Entry 'modoManual': '<S1>:5' *)
                            (* '<S1>:5:3' modo_op = 0; *)
                            modo_op := 0.0;
                            (* '<S1>:5:4' xsi=xCarro_pos; *)
                            xsi := xl;
                            (* '<S1>:5:5' ysi=yCarro_pos; *)
                            ysi := yl;
                            (* '<S1>:5:6' vx=0; *)
                            vx := 0.0;
                            (* '<S1>:5:7' vy=0; *)
                            vy := 0.0;
                            (* '<S1>:5:8' time_a=time; *)
                            time_a := b_time;
                            (* '<S1>:5:9' vx_a=0; *)
                            vx_a := 0.0;
                            (* '<S1>:5:10' vy_a=0; *)
                            vy_a := 0.0;
                            (* '<S1>:5:11' error=0; *)
                            error := 0.0;
                            (* '<S1>:5:12' delta_t=0; *)
                            (* '<S1>:5:13' modo_de_control=0; *)
                            modo_de_control := 0.0;
                            (* '<S1>:5:14' dist_desp=yCarro_pos-20; *)
                            dist_desp := yl - 20.0;
                            (* '<S1>:5:15' if(dist_desp>2) *)
                            IF dist_desp > 2.0 THEN 
                                (* '<S1>:5:16' flag_disDesP=1; *)
                                flag_disDesP := 1.0;
                            ELSE 
                                (* '<S1>:5:17' else *)
                                (* '<S1>:5:18' flag_disDesP=0; *)
                                flag_disDesP := 0.0;
                            END_IF;
                        ELSE 
                            temp1 := TRUE;
                        END_IF;
                    ELSE 
                        temp1 := TRUE;
                    END_IF;
                    IF temp1 THEN 
                        (* Outport: '<Root>/vy' *)
                        (* '<S1>:160:6' delta_t=time-time_a; *)
                        (* '<S1>:160:7' [vx,vy]=Calc_v1(delta_t,vx,vy); *)
                        i0_Calc_v1(delta_t2 := b_time - time_a, vx_a2 := vx, vy_a2 := vy);
                        vx := i0_Calc_v1.vx2;
                        vy := i0_Calc_v1.vy2;
                        (* '<S1>:160:8' time_a=time; *)
                        time_a := b_time;
                    END_IF;
            END_CASE;
        END_IF;
        (* End of Chart: '<Root>/NIVEL 1' *)
END_CASE;
END_FUNCTION_BLOCK
FUNCTION_BLOCK Calc_v
VAR_INPUT
    delta_t1: LREAL;
    vx_a1: LREAL;
    vy_a1: LREAL;
    X_com1: LREAL;
    Y_com1: LREAL;
END_VAR
VAR_OUTPUT
    vx1: LREAL;
    vy1: LREAL;
END_VAR
(* MATLAB Function 'Calc_v': '<S1>:145' *)
(* '<S1>:145:2' if (X_com1 == 29 && vx_a1<4) *)
IF (X_com1 = 29.0) AND (vx_a1 < 4.0) THEN 
    (* '<S1>:145:3' vx1=0.8*(delta_t1)+vx_a1; *)
    vx1 := (0.8 * delta_t1) + vx_a1;
ELSIF (X_com1 = 28.0) AND (vx_a1 > -4.0) THEN 
    (* '<S1>:145:4' elseif (X_com1 == 28 && vx_a1 > -4 ) *)
    (* '<S1>:145:5' vx1=-0.8*(delta_t1)+vx_a1; *)
    vx1 := (-0.8 * delta_t1) + vx_a1;
ELSE 
    (* '<S1>:145:6' else *)
    (* '<S1>:145:7' vx1=vx_a1; *)
    vx1 := vx_a1;
END_IF;
(* '<S1>:145:9' if (Y_com1 == 31 && vy_a1<1.5) *)
IF (Y_com1 = 31.0) AND (vy_a1 < 1.5) THEN 
    (* '<S1>:145:10' vy1=0.8*(delta_t1)+vy_a1; *)
    vy1 := (0.8 * delta_t1) + vy_a1;
ELSIF (Y_com1 = 30.0) AND (vy_a1 > -1.5) THEN 
    (* '<S1>:145:11' elseif (Y_com1==30 && vy_a1>-1.5) *)
    (* '<S1>:145:12' vy1=-0.8*(delta_t1)+vy_a1; *)
    vy1 := (-0.8 * delta_t1) + vy_a1;
ELSE 
    (* '<S1>:145:13' else *)
    (* '<S1>:145:14' vy1=vy_a1; *)
    vy1 := vy_a1;
END_IF;
END_FUNCTION_BLOCK
FUNCTION_BLOCK Calc_v1
VAR_INPUT
    delta_t2: LREAL;
    vx_a2: LREAL;
    vy_a2: LREAL;
END_VAR
VAR_OUTPUT
    vx2: LREAL;
    vy2: LREAL;
END_VAR
(* MATLAB Function 'Calc_v1': '<S1>:169' *)
(* '<S1>:169:2' if (vx_a2 < 0 ) *)
IF vx_a2 < 0.0 THEN 
    (* '<S1>:169:3' vx2=0.2*(delta_t2)+vx_a2; *)
    vx2 := (0.2 * delta_t2) + vx_a2;
ELSE 
    (* '<S1>:169:4' else *)
    (* '<S1>:169:5' vx2=-0.2*(delta_t2)+vx_a2; *)
    vx2 := (-0.2 * delta_t2) + vx_a2;
END_IF;
(* '<S1>:169:7' if (vy_a2 < 0) *)
IF vy_a2 < 0.0 THEN 
    (* '<S1>:169:8' vy2=0.2*(delta_t2)+vy_a2; *)
    vy2 := (0.2 * delta_t2) + vy_a2;
ELSE 
    (* '<S1>:169:9' else *)
    (* '<S1>:169:10' vy2=-0.2*(delta_t2)+vy_a2; *)
    vy2 := (-0.2 * delta_t2) + vy_a2;
END_IF;
END_FUNCTION_BLOCK
FUNCTION Calc_error: LREAL
VAR_INPUT
    xf: LREAL;
    xpos: LREAL;
    yf: LREAL;
    ypos: LREAL;
END_VAR
VAR_TEMP
    a: LREAL;
    b_a: LREAL;
END_VAR
(* MATLAB Function 'Calc_error': '<S1>:123' *)
(* '<S1>:123:2' er=((xf-xpos)^2+(yf-ypos)^2)^0.5; *)
a := xf - xpos;
b_a := yf - ypos;
Calc_error := SQRT((a * a) + (b_a * b_a));
END_FUNCTION
VAR_GLOBAL CONSTANT
    NIVEL_IN_NO_ACTIVE_CHILD: USINT := 0;
    NIVEL_IN_Cargado: USINT := 1;
    NIVEL_IN_Descargado: USINT := 2;
    NIVEL_IN_Activado: USINT := 1;
    NIVEL_IN_Desactivado: USINT := 2;
    NIVEL_IN_Automatico: USINT := 1;
    NIVEL_IN_modoManual: USINT := 2;
    NIVEL_IN_transicion: USINT := 3;
    NIVEL_IN_transicion1: USINT := 4;
    NIVEL_IN_CicloDoble: USINT := 1;
    NIVEL_IN_CicloSimple: USINT := 2;
    NIVEL_IN_standby: USINT := 3;
    NIVEL_IN_cargaBarco: USINT := 1;
    NIVEL_IN_descaragBarco: USINT := 2;
    NIVEL_IN_idaBarco: USINT := 3;
    NIVEL_IN_standby_n: USINT := 4;
    NIVEL_IN_vueltaMuelle: USINT := 5;
    SS_INITIALIZE: SINT := 0;
    SS_STEP: SINT := 1;
END_VAR
