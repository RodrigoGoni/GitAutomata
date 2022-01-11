function array_out = Nivel1(array_in)
persistent init_server;
persistent init_nodes;
persistent uaClient;
persistent var_node_in;
persistent var_node_out;
persistent vx_out vy_out velmY_out velmX_out ysf_out ysi_out xsi_out xsf_out modo_de_control_out modo_op_out flag_disDesP_out;
persistent ssMethodType_in X_com_in Y_com_in yef_in xef_in cD_in cS_in sCarga_in cAng_in xCarro_pos_in Parada_in b_time_in yCarro_pos_in modo_in theta_in vel_Izmax_in flag_emergencia_in posF_flag_in;
if (isempty(init_server))
    vx_out = 0;
    init_server = 0;
    init_nodes = 0;
    vy_out = 0;
    velmY_out = 0;
end
if init_server == 0
    init_server = 1 ;
    uaClient = opcua('localhost',4840);
    connect(uaClient,'PLC_RO','532');
end
if uaClient.isConnected == 1 && init_nodes == 0
    init_nodes = 1;
    var_node_in = findNodeByName(uaClient.Namespace,'INPUTS','-once');
    var_node_out = findNodeByName(uaClient.Namespace,'OUTPUTS','-once');
    vx_out = findNodeByName(var_node_out,'vx','-once');
    vy_out = findNodeByName(var_node_out,'vy','-once');
    velmY_out = findNodeByName(var_node_out,'velmY','-once');
    velmX_out = findNodeByName(var_node_out,'velmX','-once');
    ysf_out = findNodeByName(var_node_out,'ysf','-once');
    ysi_out = findNodeByName(var_node_out,'ysi','-once');
    xsi_out = findNodeByName(var_node_out,'xsi','-once');
    xsf_out = findNodeByName(var_node_out,'xsf','-once');
    modo_de_control_out = findNodeByName(var_node_out,'modo_de_control','-once');
    modo_op_out = findNodeByName(var_node_out,'modo_op','-once');
    flag_disDesP_out = findNodeByName(var_node_out,'flag_disDesP','-once');
    ssMethodType_in = findNodeByName(var_node_in,'ssMethodType','-once');
    X_com_in = findNodeByName(var_node_in,'X_com','-once');
    Y_com_in = findNodeByName(var_node_in,'Y_com','-once');
    yef_in = findNodeByName(var_node_in,'yef','-once');
    xef_in = findNodeByName(var_node_in,'xef','-once');
    cD_in = findNodeByName(var_node_in,'cD','-once');
    cS_in = findNodeByName(var_node_in,'cS','-once');
    sCarga_in = findNodeByName(var_node_in,'sCarga','-once');
    cAng_in = findNodeByName(var_node_in,'cAng','-once');
    xCarro_pos_in = findNodeByName(var_node_in,'xCarro_pos','-once');
    Parada_in = findNodeByName(var_node_in,'Parada','-once');
    b_time_in = findNodeByName(var_node_in,'b_time','-once');
    yCarro_pos_in = findNodeByName(var_node_in,'yCarro_pos','-once');
    modo_in = findNodeByName(var_node_in,'modo','-once');
    theta_in = findNodeByName(var_node_in,'theta','-once');
    vel_Izmax_in = findNodeByName(var_node_in,'vel_Izmax','-once');
    flag_emergencia_in = findNodeByName(var_node_in,'flag_emergencia','-once');
    posF_flag_in = findNodeByName(var_node_in,'posF_flag','-once');
end

if uaClient.isConnected == 1 && init_nodes == 1
    [vx,~,~] = readValue(uaClient,vx_out);
    [vy,~,~]=readValue(uaClient,vy_out);
    [velmY,~,~]=readValue(uaClient,velmY_out);
    [velmX,~,~]=readValue(uaClient,velmX_out);
    [ysf,~,~]=readValue(uaClient,ysf_out);
    [ysi,~,~]=readValue(uaClient,ysi_out);
    [xsi,~,~]=readValue(uaClient,xsi_out);
    [xsf,~,~]=readValue(uaClient,xsf_out);
    [modo_de_control,~,~]=readValue(uaClient,modo_de_control_out);
    [modo_op,~,~]=readValue(uaClient,modo_op_out);
    [flag_disDesP,~,~]=readValue(uaClient,flag_disDesP_out);
    writeValue(ssMethodType_in,array_in(1));
    writeValue(X_com_in,array_in(2));
    writeValue(Y_com_in,array_in(3));
    writeValue(yef_in,array_in(4));
    writeValue(xef_in,array_in(5));
    writeValue(cD_in,array_in(6));
    writeValue(cS_in,array_in(7));
    writeValue(sCarga_in,array_in(8));
    writeValue(cAng_in,array_in(9));
    writeValue(xCarro_pos_in,array_in(10));
    writeValue(Parada_in,array_in(11));
    writeValue(b_time_in,array_in(12));
    writeValue(yCarro_pos_in,array_in(13));
    writeValue(modo_in,array_in(14));
    writeValue(theta_in,array_in(15));
    writeValue(vel_Izmax_in,array_in(16));
    writeValue(flag_emergencia_in,array_in(17));
    writeValue(posF_flag_in,array_in(18));
end
array_out=[vx,vy,velmY,velmX,ysf,ysi,xsi,xsf,modo_de_control,modo_op,flag_disDesP];
end