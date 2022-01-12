function array_out = Nivel0(array_in)
persistent init_server;
persistent init_nodes;
persistent uaClient;
persistent var_node_in;
persistent var_node_out;
persistent alarmaC_out alarmaG_out alarmaIz_out alarmaM_out vy_out vx_out flag_control_out flag_emergencia_out;
persistent ssMethodType_in X_com_in Y_com_in FCxc_80_in FCxc_0_in FCi_in S_e1_in S_e2_in S_e3_in vMi_in vi_in b_time_in yCarro_pos_in vc_in theta_in FinEmer_in;


if (isempty(init_server))
    init_server = 0;
    init_nodes = 0;
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
    vx_out = findNodeByName(var_node_out,'vxN0','-once');
    vy_out = findNodeByName(var_node_out,'vyN0','-once');
    alarmaC_out = findNodeByName(var_node_out,'alarmaC','-once');
    alarmaG_out = findNodeByName(var_node_out,'alarmaG','-once');
    alarmaIz_out = findNodeByName(var_node_out,'alarmaIz','-once');
    alarmaM_out = findNodeByName(var_node_out,'alarmaM','-once');
    flag_control_out = findNodeByName(var_node_out,'flag_control','-once');
    flag_emergencia_out = findNodeByName(var_node_out,'flag_emergenciaN0','-once');
    ssMethodType_in = findNodeByName(var_node_in,'ssMethodType','-once');
    X_com_in = findNodeByName(var_node_in,'X_com','-once');
    Y_com_in = findNodeByName(var_node_in,'Y_com','-once');
    FCxc_80_in = findNodeByName(var_node_in,'FCxc_80','-once');
    FCxc_0_in = findNodeByName(var_node_in,'FCxc_0','-once');
    FCi_in = findNodeByName(var_node_in,'FCi','-once');
    S_e1_in = findNodeByName(var_node_in,'S_e1','-once');
    S_e2_in = findNodeByName(var_node_in,'S_e2','-once');
    S_e3_in = findNodeByName(var_node_in,'S_e3','-once');
    vMi_in = findNodeByName(var_node_in,'vMi','-once');
    vi_in = findNodeByName(var_node_in,'vi','-once');
    b_time_in = findNodeByName(var_node_in,'b_time','-once');
    yCarro_pos_in = findNodeByName(var_node_in,'yCarro_pos','-once');
    vc_in = findNodeByName(var_node_in,'vc','-once');
    theta_in = findNodeByName(var_node_in,'theta','-once');
    FinEmer_in = findNodeByName(var_node_in,'FinEmer','-once');
end

if uaClient.isConnected == 1 && init_nodes == 1
    [vx,~,~] = readValue(uaClient,vx_out);
    [vy,~,~]=readValue(uaClient,vy_out);
    [velmY,~,~]=readValue(uaClient,alarmaC_out);
    [velmX,~,~]=readValue(uaClient,alarmaG_out);
    [ysf,~,~]=readValue(uaClient,alarmaIz_out);
    [ysi,~,~]=readValue(uaClient,alarmaM_out);
    [xsi,~,~]=readValue(uaClient,flag_control_out);
    [xsf,~,~]=readValue(uaClient,flag_emergencia_out);
    writeValue(ssMethodType_in,array_in(1));
    writeValue(X_com_in,array_in(2));
    writeValue(Y_com_in,array_in(3));
    writeValue(FCxc_80_in,array_in(4));
    writeValue(FCxc_0_in,array_in(5));
    writeValue(FCi_in,array_in(6));
    writeValue(S_e1_in,array_in(7));
    writeValue(S_e2_in,array_in(8));
    writeValue(S_e3_in,array_in(9));
    writeValue(vMi_in,array_in(10));
    writeValue(vi_in,array_in(11));
    writeValue(b_time_in,array_in(12));
    writeValue(yCarro_pos_in,array_in(13));
    writeValue(vc_in,array_in(14));
    writeValue(theta_in,array_in(15));
    writeValue(FinEmer_in,array_in(16));
end
array_out=[alarmaC_out,vy,velmY,velmX,ysf,ysi,xsi,xsf,modo_de_control,modo_op,flag_disDesP];

end