" Syntax file for logs for the
" `Ouroboros.Network.ConnectionManager.Server.bidirectional_IO`
" test.

syntax clear
setl iskeyword+=-

" systemd service message
syn match NodeStart /Started cardano-node.service - cardano-node service./
" node message when it starts
syn match NodeStart /Node configuration/
syn match NodeBasicInfo /\<cardano.node.basicInfo.\%(version\|protocol\|nodeStartTime\|systemStartTime\|slotLengthByron\|epochLengthByron\|slotLengthShelley\|epochLengthShelley\|slotsPerKESPeriodShelley\|slotLengthAllegra\|slotLengthAllegra\|slotsPerKESPeriodAllegra\|slotLengthMary\|epochLengthMary\|slotsPerKESPeriodMary\|slotLengthAlonzo\|epochLengthAlonzo\|slotsPerKESPeriodAlonzo\|slotLengthBabbage\|epochLengthBabbage\|slotsPerKESPeriodBabbage\|\)\>/

" syn match P2P_Node0 /\<\(MsgDone\|TrDemotedToCold\(Local\|Remote\)\|TrPromotedToWarmRemote\|TrDemotedToRemoteColdEdge\|TrPromotedToRemoteEstablished\)\>/
syn keyword P2P_CM TrConnect Connect TrIncludeConnection IncludeConnection TrReusedConnection ReusedConnection
syn keyword P2P_CM TrReleaseConnection ReleaseConnection TrConnectionCleanup ConnectionCleanup TrConnectionTimeWait ConnectionTimeWait
syn keyword P2P_CM TrConnectionTimeWaitDone ConnectionTimeWaitDone TrTerminatingConnection TerminatingConnection
syn keyword P2P_CM TrTerminatedConnection TerminatedConnection TrConnectionNotFound ConnectionNotFound ToConnectTo ConnectTo
syn keyword P2P_CM TrUnexpectedlyFalseAssertion UnexpectedlyFalseAssertion TrConnectionHandler ConnectionHandler
syn keyword P2P_CM TrPruneConnections PruneConnections
syn keyword P2P_CM Inbound Outbound
syn keyword P2P_CM TrConnectionExists
syn keyword P2P_Error TrConnectError TrServerError InUnsupportedState TrConnectionHandlerError
syn keyword P2P_Error TrFobiddenConnection TrConnectionFailure
syn keyword P2P_Error OutboundGovernorCriticalFailure
syn keyword P2P_Error TrAcceptError
syn keyword P2P_Error   ConnectError   ServerError InUnsupportedState ConnectionHandlerError
syn keyword P2P_Error   ConnectionExists   FobiddenConnection   ConnectionFailure
syn keyword P2P_Error   AcceptError

syn keyword P2P_Exit    TrConnectionExit
syn keyword P2P_Exit      ConnectionExit
syn keyword P2P_Server TrShutdown TrAcceptConnection TrServerStarted TrServerStopped TrAcceptPolicyTrace
syn keyword P2P_Server   Shutdown   AcceptConnection   ServerStarted   ServerStopped   AcceptPolicyTrace
syn keyword P2P_Server ServerTraceAcceptConnectionRateLimiting 
syn keyword P2P_Server ServerTraceAcceptConnectionHardLimit
syn keyword P2P_Server ServerTraceAcceptConnectionResume
syn match P2P_Comment /^--.*/
syn keyword P2P_CMState Known Unknow
syn keyword P2P_CMState ReservedOutboundState UnknownConnectionState UnnegotiatedState InboundIdleState OutboundState OutboundUniState OutboundDupState OutboundIdleState TerminatingState TerminatedState
syn keyword P2P_CMState ReservedOutboundSt UnknownConnectionSt UnnegotiatedSt InboundIdleState InboundState DuplexState
syn keyword P2P_CMState OutboundUniSt OutboundDupSt OutboundIdleSt InboundIdleSt InboundSt DuplexSt
syn keyword P2P_CMState RemoteIdleSt TerminatingSt TerminatedSt
syn keyword P2P_CMState Ticking Expired

syn keyword P2P_IG      TrNewConnection TrResponderRestarted TrWaitIdleRemote TrPromotedToWarmRemote
syn keyword P2P_IG        NewConnection   ResponderRestarted   WaitIdleRemote   PromotedToWarmRemote
" syn keyword P2P_IG TrResponderStarted TrResponderTerminated
syn keyword P2P_IG      TrPromotedToWarmRemote TrPromotedToHotRemote
syn keyword P2P_IG        PromotedToWarmRemote   PromotedToHotRemote
syn keyword P2P_IG      TrDemotedToWarmRemote TrDemotedToColdRemote
syn keyword P2P_IG        DemotedToWarmRemote   DemotedToColdRemote
syn keyword P2P_IG      TrWaitIdleRemote TrMuxCleanExit TrRemoteState
syn keyword P2P_IG        WaitIdleRemote   MuxCleanExit   RemoteState
syn keyword P2P_IG      TrPromoteColdDone TrPromoteWarmPeers TrPromoteWarmDone TrPromoteColdBigLedgerPeerDone TrPromoteWarmBigLedgerPeerDone
syn keyword P2P_IG        PromoteColdDone   PromoteWarmPeers   PromoteWarmDone   PromoteColdBigLedgerPeerDone   PromoteWarmBigLedgerPeerDone
syn keyword P2P_IG      TrMaturedConnections TrInactive
syn keyword P2P_IG        MaturedConnections   Inactive
syn keyword P2P_IG      KeepTr
syn keyword P2P_IGState RemoteHotSt RemoteWarmSt RemoteIdleSt RemoteColdSt
syn keyword P2P_Counters TrInboundGovernorCounters InboundGovernorCounters hotPeers warmPeers coldPeers idlePeers idle warm hot 
syn keyword P2P_Counters hotBigLedgerPeers warmBigLedgerPeers coldBigLedgerPeers
syn keyword P2P_Counters TrConnectionManagerCounters ConnectionManagerCounters fullduplex duplex unidirectional outbound inbound terminating fullDuplex
syn keyword P2P_Counters PeerSelectionCounters

syn keyword P2P_Event   EventSay TrDebug

syn keyword P2P_Error   UnsupportedState TrResponderStartFailure TrResponderErrored
syn keyword P2P_Error   TrMuxErrored TrUnexpectedlyFalseAssertion
syn keyword P2P_Error   NotReleasedConnections
syn keyword MUX_Error   SDUReadTimeout SDUWriteTimeout SDUDecodeError IOException IngressQueueOverRun UnknownMiniProtocol

syn keyword P2P_CH      TrHandshakeSuccess
syn keyword P2P_CH        HandshakeSuccess
syn keyword P2P_Error   TrHandshakeClientError TrHandshakeServerError TrError
syn keyword P2P_Error     HandshakeClientError   HandshakeServerError   Error
syn keyword P2P_Error   ExceededSizeLimit
syn keyword P2P_Warning ExceededTimeLimit

syn keyword P2P_Warning AsyncCancelled ThreadKilled DisabledLedgerPeers UseLedgerAfter

syn keyword P2P_Governor PeerStatusChanged HotToCold WarmToHot WarmToCold ColdToHot ColdToWarm HotToWarm WarmToCooling HotToCooling CoolingToCold
syn keyword P2P_Governor PeerMonitoringResult
syn keyword P2P_Error PeerMonitoringError AcquireConnectionError
syn keyword ChainSync ChainSyncClientEvent TraceTermination

syn match IPAddress /\(\d\{1,3}\.\)\{3}\d\{1,3}\(:\d\+\)\?/

syn keyword CardanoWarning ErrorPolicySuspendPeer ErrorPolicySuspendConsumer
syn keyword CardanoWarning ErrorPolicyTrace
syn keyword CardanoError   MuxError InvalidBlock
syn match   CardanoError /\<\(Connection\|Application\)ExceptionTrace\>/

syn keyword P2P_OG_Env    TraceEnvAddPeers TraceEnvSetLocalRoots TraceEnvRequestPublicRootPeers TraceEnvSetPublicRoots TraceEnvPublicRootTTL TraceEnvGossipTTL
syn keyword P2P_OG_Env    TraceEnvSetTargets TraceEnvPeersDemote TraceEnvRootsResult TraceEnvGossipRequest TraceEnvGossipResult TraceEnvPeersStatus 
syn keyword P2P_OG_Env    TraceEnvActivatePeer TraceEnvDeactivatePeer TraceEnvCloseConn
syn keyword P2P_OG_Env    TraceEnvEstablishConn

syn keyword P2P_OG_Notice GovernorDebug GovernorEvent

syn keyword P2P_OG_Notice TraceGovernorState TracePromoteColdPeers TracePromoteWarmPeers TraceDemoteWarmPeers TraceDemoteHotPeers TraceTargetsChanged
syn keyword P2P_OG_Notice TracePromoteColdBigLedgerPeers TracePromoteWarmBigLedgerPeers TraceDemoteWarmBigLedgerPeers TraceDemoteHotBigLedgerPeers
syn keyword P2P_OG_Notice TraceLocalRootDomains TraceLocalRootDNSMap TraceLocalRootPeers TraceLocalRootResult TraceLocalRootGroups 
syn keyword P2P_OG_Notice TraceLocalRootPersChanged TraceTragetsChanged TracePublicRootsRequest TracePublicRootsResults TracePublicRootsFailure
syn keyword P2P_OG_Notice TraceGossipRequests TraceGossipResults TraceForgetColdPeers
syn keyword P2P_OG_Notice TracePromoteColdDone TracePromoteColdFailed TracePromoteWarmDone TracePromoteWarmFailed TracePromoteWarmAborted TraceDemoteWarmDome TraceDemoteHotDone TraceDemoteHotFailed TracePromoteColdBigLedgerPeerDone TracePromoteWarmBigLedgerPeerDone
syn keyword P2P_OG_Notice TracePromoteColdLocalPeers TraceDemoteLocalHotPeers TraceDemoteLocalAsynchronous TraceDemoteAsynchronous TraceGovernorWakeup TraceChurnWait TraceChurnMode

" the same but without 'Trace'
syn keyword P2P_OG_Notice PromoteWarmLocalPeers PromoteColdLocalPers
syn keyword P2P_OG_Notice GovernorState PromoteColdPeers PromoteWarmPeers DemoteWarmPeers DemoteHotPeers TargetsChanged
syn keyword P2P_OG_Notice PromoteColdBigLedgerPeers PromoteWarmBigLedgerPeers DemoteWarmBigLedgerPeers DemoteHotBigLedgerPeers
syn keyword P2P_OG_Notice GossipRequests GossipResults ForgetColdPeers
syn keyword P2P_OG_Notice LocalRootPersChanged TragetsChanged PublicRootsRequest PublicRootsResults PublicRootsFailure
syn keyword P2P_OG_Notice PromoteColdDone PromoteColdFailed PromoteWarmDone PromoteWarmFailed PromoteWarmAborted DemoteWarmDome DemoteHotDone DemoteHotFailed
syn keyword P2P_OG_Notice PromoteColdLocalPeers DemoteLocalHotPeers DemoteAsynchronous GovernorWakeup ChurnWait ChurnMode ChurnModeNormal ChurnAction ChurnTimeout

syn keyword SendRecv  Send Recv
syn keyword Handshake MsgProposeVersions MsgReplyVersions MsgQueryReply MsgAcceptVersion MsgRefuse

syn keyword LocalRoots TraceLocalRootPeersChanged TracePromoteWarmLocalPeers TracePromoteColdLocalPers TraceLocalRootResult 
syn keyword LocalRoots      LocalRootPeersChanged      PromoteWarmLocalPeers      PromoteColdLocalPers      LocalRootResult
syn keyword LocalRoots   LocalRootGroups
syn keyword CardanoError TraceLocalRootFailure TraceLocalRootError
syn keyword CardanoError      LocalRootError        LocalRootFailure

syn keyword P2P_OG_Info   PeerSelectionState PeerSelectionTargets KnownPeers KnownPeerInfo EstablishedPeers activePeers availableToConnect nextConnectTimes EstablishedPeers nextActivateTimes activePeers publicRootBackoffs

syn keyword P2P_OG_Info   PeerHot PeerWarm PeerCooling PeerCold
syn keyword P2P_OG_Notice PublicRootsRequest
syn keyword P2P_OG_Info   RequestForPeers ReusingLedgerState PickedPeer 
syn match   P2P_OG_Info   /\<PeerAddr\s\+\d\+/
syn keyword P2P_OG_Error  ActivationError DeactivationError

syn keyword P2P_OG_Notice InitiatorDir ResponderDir

syn keyword P2P_IOSimPOR_ EventThreadForked EventThreadWake EventThreadSleep
syn keyword P2P_IOSimPOR_ ControlFollow ControlAwait ControlSleep ControlDefault ScheduleMod
syn keyword P2P_IOSimPOR_ SimRacesFound RacesFound Effect

syn keyword P2P_IOSimPOR  EventFollowControl EventAwaitControl EventPerformAction
syn keyword P2P_IOSimPOR  EventReschedule EventDeschedule
syn keyword P2P_IOSimPOR  Yield Interruptable Blocked Sleep Terminated EventThreadFinished
syn keyword IOSimStart    EventSimStart

syn keyword IOSim         EventThrowToBlocked EventThrwoToWakeup
syn keyword IOSim         EventThrowToUnmasked
syn keyword IOSimSTM      EventTxCommitted EventTxBlocked EventTxAborted EventTxWakeup

syn keyword SimNet        STConnecting STConnected STAccetping STAccepted STClosing
syn keyword SimNet        STClosed STClosingQueue STClosedQueue
syn keyword P2P_Error     STConnectError STConnectTimeout STAcceptFailure
syn keyword SimNet        STBearerInfo STBearer STAttenuatedChannelTrace

syn region  IOSimThrowRg contains=IOSimThrowEv,IOSimThrow nextgroup=IOSimThrowEv start=/IOSimThrow\(To\)\?/ end=/$/
syn keyword IOSimThrowEv nextgroup=IOSimThrow EventThrow EventThrowTo
syn match   IOSimThrow   contained /.*$/hs=s+1
syn match   IOSimThrow   contained /.\{-}\ze\(Racy\)\?ThreadId/hs=s+1,he=e-1

syntax keyword FetchTraceKind BlockFetchDecision
syntax keyword FetchTrace PeerFetch FetchDeclineChainNotPlausible FetchDeclineChainNoIntersection FetchDeclineAlreadyFetched FetchDeclineInFlightThisPeer
syntax keyword FetchTrace FetchDeclineInFlightOtherPeer FetchDeclinePeerShutdown FetchDeclinePeerSlow FetchDeclineReqsInFlightLimit FetchDeclineBytesInFlightLimit
syntax keyword FetchTrace FetchDeclinePeerBusy FetchDeclineConcurrencyLimit
syntax keyword FetchTrace FetchDecision declined results

syntax keyword ChainDBKind ChainDB
syntax keyword ChainDBInfo newtip
syntax match ChainDBDebug /\<[a-z0-9]\{64}\%(@\d\+\)\?\>/
syntax keyword ChainDB TraceAddBlockEvent AddedToCurrentChain TraceCopyToImmutableDBEvent CopiedBlockToImmutableDB
syntax keyword ChainDB TraceImmDbEvent TraceCacheEvent TracePastChunkEvict
syntax keyword ChainDB AddBlockValidation UpdateLedgerDb
syntax keyword ChainDB TraceFollowerEvent NewFollower
syntax keyword P2P_Protocol KeepAlive TxSubmission ChainSync BlockFetch LocalTxSubmission LocalStateQuery Handshake
syntax keyword P2P_Protocol ClientAgency ServerAgency
syntax keyword P2P_Protocol TokIdle TokNext TokIntersect TokDone TokClient TokServer TokBusy TokStreaming TokPropose TokConfirm

syntax keyword NodeConfig NetworkConfig NodeConfiguration StartupInfo StartupTime NetworkMagic unNetworkMagic nodeStartTime protocol version
" WarningDevelopmentNetworkProtocols

syntax keyword ChainSync MsgRequestNext MsgAwaitReply MsgRollForward MsgRollBackward MsgFindIntersect MsgIntersectFound MsgIntersectNotFound MsgDone prtcl-2
syntax match   ChainSync /\<MiniProtocolNum 2\>/
syntax keyword BlockFetch MsgRequestRange MsgStartBatch MsgNoBlocks MsgBlock MsgBatchDone MsgClientDone prtcl-3
syntax match   BlockFetch /\<MiniProtocolNum 3\>/
syntax keyword TxSubmission MsgInit MsgRequestTxIds MsgReplyTxIds MsgRequestTxs MsgReplyTxs MsgDone prtcl-4
syntax match   TxSubmission /\<MiniProtocolNum 4\>/
syntax keyword KeepAlive MsgKeepAlive MsgKeepAliveResponse MsgDone  prtcl-8
syntax match   KeepAlive /\<MiniProtocolNum 8\>/
syntax keyword PeerSharing MsgShareRequest MsgSharePeers MsgDone prtcl-10
syntax match   PeerSharing /\<MiniProtocolNum 10\>/
syntax keyword PingPong MsgPing MsgPong MsgDone prtcl-9
syntax match   PingPong /\<MiniProtocolNum 9\>/

syntax keyword TxSubmissionTrace TraceTxSubmissionCollected TraceTxSubmissionProcessed TraceTxInboundCanRequestMoreTxs TraceTxInboundCannotRequestMoreTxs TraceTxInboundAddedToMempool TraceTxInboundRejectedFromMempool TraceTxInboundTerminated TraceTxInboundDecision
syntax keyword TxSubmissionTrace TraceTxDecisions TraceSharedTxState

syntax match NetworkLib /Network\.Socket\.\w\+/

syntax keyword SimEvents TrJoiningNetwork TrKillingNode TrReconfiguringNode TrUpdatingDNS TrRunning TrErrored

hi link P2P_Provenance Constant
hi link P2P_CM      Statement
hi link P2P_CMState Constant
hi link P2P_IG      Statement
hi link P2P_IGState Constant
hi link P2P_Server  Statement
hi link P2P_Exit    Constant
hi link P2P_Event   String
hi link P2P_CH      PreProc
hi link P2P_Counters NonText
hi link P2P_Governor Constant

hi link P2P_OG_Notice Exception
hi link P2P_OG_Info   SpecialKey
hi link P2P_OG_Env    CursorLineSign
hi link P2P_OG_Error  ErrorMsg

hi link SimEvents Keyword

hi link CardanoError  Error
hi link CardanoWarning WarningMsg

hi link P2P_Error   Error
hi link MUX_Error   Error
hi link P2P_Warning Title
hi link P2P_Comment Comment
hi link TxSubmission Keyword
hi link ChainSync    Keyword
hi link BlockFetch   Keyword
hi link KeepAlive    Keyword
hi link PingPong     Keyword
hi link TxSubmissionTrace Comment

hi link IPAddress String

hi link IOSimStart  WildMenu
hi link IOSimThrowEv IOSim
hi link IOSimThrow  ErrorMsg

hi link LocalRoots    Exception

hi FetchTraceKind cterm=bold gui=bold guifg=LightGreen
hi link FetchTrace Constant

hi ChainDBKind cterm=bold gui=bold guifg=LightGreen
hi ChainDBInfo guifg=LightGreen
hi ChainDBDebug guifg=#505050
" hi link ChainDB Constant
hi ChainDB guifg=#7656ff

hi P2P_IOSimPOR_  cterm=bold guifg=#d35704
hi P2P_IOSimPOR              guifg=#993f04
hi IOSim                     guifg=#993f04
hi IOSimSTM                  guifg=#a55764
hi link SimNet Folded

hi link NodeStart  Title
hi link NodeBasicInfo Constant
hi link NodeConfig Constant
hi link NetworkLib ModeMsg
hi link P2P_Protocol WarningMsg
hi link SendRecv WarningMsg
hi link Handshake WarningMsg
