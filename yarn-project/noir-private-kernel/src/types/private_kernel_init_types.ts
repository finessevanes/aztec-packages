/* Autogenerated file, do not edit! */

/* eslint-disable */

type Field = number;
type u32 = number;

interface Address {
  inner: Field;
}


interface Point {
  x: Field;
  y: Field;
}


interface EthAddress {
  inner: Field;
}


interface ContractDeploymentData {
  deployer_public_key: Point;
  constructor_vk_hash: Field;
  function_tree_root: Field;
  contract_address_salt: Field;
  portal_contract_address: EthAddress;
}


interface TxContext {
  is_fee_payment_tx: boolean;
  is_rebate_payment_tx: boolean;
  is_contract_deployment_tx: boolean;
  contract_deployment_data: ContractDeploymentData;
  chain_id: Field;
  version: Field;
}


interface FunctionSelector {
  inner: u32;
}


interface FunctionData {
  selector: FunctionSelector;
  is_internal: boolean;
  is_private: boolean;
  is_constructor: boolean;
}


interface TxRequest {
  origin: Address;
  args_hash: Field;
  tx_context: TxContext;
  function_data: FunctionData;
}







interface CallContext {
  msg_sender: Address;
  storage_contract_address: Address;
  portal_contract_address: EthAddress;
  function_selector: FunctionSelector;
  is_delegate_call: boolean;
  is_static_call: boolean;
  is_contract_deployment: boolean;
}


interface Block {
  private_data_tree_root: Field;
  nullifier_tree_root: Field;
  contract_tree_root: Field;
  l1_to_l2_data_tree_root: Field;
  public_data_tree_root: Field;
  global_variables_hash: Field;
}


interface HistoricalBlockData {
  blocks_tree_root: Field;
  block: Block;
  private_kernel_vk_tree_root: Field;
}



interface PrivateCircuitPublicInputs {
  call_context: CallContext;
  args_hash: Field;
  return_values: Field[];
  read_requests: Field[];
  new_commitments: Field[];
  new_nullifiers: Field[];
  nullified_commitments: Field[];
  private_call_stack: Field[];
  public_call_stack: Field[];
  new_l2_to_l1_msgs: Field[];
  encrypted_logs_hash: Field[];
  unencrypted_logs_hash: Field[];
  encrypted_log_preimages_length: Field;
  unencrypted_log_preimages_length: Field;
  historical_block_data: HistoricalBlockData;
  contract_deployment_data: ContractDeploymentData;
  chain_id: Field;
  version: Field;
}



interface CallStackItem {
  contract_address: Address;
  public_inputs: PrivateCircuitPublicInputs;
  is_execution_request: boolean;
  function_data: FunctionData;
}


interface PrivateCallStackItem {
  inner: CallStackItem;
}


interface Proof {
}


interface VerificationKey {
}


interface MembershipWitness {
  leaf_index: Field;
  sibling_path: Field[];
}



interface ReadRequestMembershipWitness {
  leaf_index: Field;
  sibling_path: Field[];
  is_transient: boolean;
  hint_to_commitment: Field;
}



interface PrivateCallData {
  call_stack_item: PrivateCallStackItem;
  private_call_stack_preimages: PrivateCallStackItem[];
  proof: Proof;
  vk: VerificationKey;
  function_leaf_membership_witness: MembershipWitness;
  contract_leaf_membership_witness: MembershipWitness;
  read_request_membership_witnesses: ReadRequestMembershipWitness[];
  portal_contract_address: EthAddress;
  acir_hash: Field;
}


interface PrivateKernelInputsInit {
  tx_request: TxRequest;
  private_call: PrivateCallData;
}


interface AggregationObject {
}




interface NewContractData {
  contract_address: Address;
  portal_contract_address: EthAddress;
  function_tree_root: Field;
}




interface OptionallyRevealedData {
  call_stack_item_hash: Field;
  function_data: FunctionData;
  vk_hash: Field;
  portal_contract_address: EthAddress;
  pay_fee_from_l1: boolean;
  pay_fee_from_public_l2: boolean;
  called_from_l1: boolean;
  called_from_public_l2: boolean;
}


interface PublicDataUpdateRequest {
  leaf_index: Field;
  old_value: Field;
  new_value: Field;
}


interface PublicDataRead {
  leaf_index: Field;
  value: Field;
}


interface CombinedAccumulatedData {
  aggregation_object: AggregationObject;
  read_requests: Field[];
  new_commitments: Field[];
  new_nullifiers: Field[];
  nullified_commitments: Field[];
  private_call_stack: Field[];
  public_call_stack: Field[];
  new_l2_to_l1_msgs: Field[];
  encrypted_logs_hash: Field[];
  unencrypted_logs_hash: Field[];
  encrypted_log_preimages_length: Field;
  unencrypted_log_preimages_length: Field;
  new_contracts: NewContractData[];
  optionally_revealed_data: OptionallyRevealedData[];
  public_data_update_requests: PublicDataUpdateRequest[];
  public_data_reads: PublicDataRead[];
}




interface CombinedConstantData {
  block_data: HistoricalBlockData;
  tx_context: TxContext;
}


interface KernelCircuitPublicInputs {
  end: CombinedAccumulatedData;
  constants: CombinedConstantData;
  is_private: boolean;
}

export interface ReturnType {
  value: KernelCircuitPublicInputs;
}

export interface InputType {
  input: PrivateKernelInputsInit;
}