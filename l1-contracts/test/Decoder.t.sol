// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.18;

import {Test} from "forge-std/Test.sol";

import {Decoder} from "@aztec3/core/Decoder.sol";
import {Rollup} from "@aztec3/core/Rollup.sol";

contract DecodeHelper is Decoder {
  function decode(bytes calldata _l2Block)
    external
    pure
    returns (uint256, bytes32, bytes32, bytes32)
  {
    return _decode(_l2Block);
  }

  function computeDiffRoot(bytes calldata _l2Block) external pure returns (bytes32) {
    return _computeDiffRoot(_l2Block);
  }
}

// Blocks generated using `circuit_block_builder.test.ts`
contract DecoderTest is Test {
  Rollup internal rollup;
  DecodeHelper internal helper;

  bytes block_1 =
    hex"000000010668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e15000000002d39729fd006096882acfbd350c91fd61883578b4fe35b63cdce3c1993a497ea000000082f8dc86ba80d8fcf491fb7a255f4163e4f9601d022ba0be35f13297531073fd80000000019c36f7bc2e4116d082865cc0b4ac8e16e9efa00ace9fb2222dd1dfd719cb671000000012b36b22912aa963f143c490227bd21e7a44338026b2f6a389cb98e82167c3718000000010283622796e1a2fa4718e254eb46d3f4287b05a5aaee35af02a54f2af8362f97000000101f99db4b9ffa5ab637607ad50c7d10ea3352a53478e14354355a02b6a87a7ab1000000181ba22861f1a04d910c399ce20125a7ef53c3a47e0f51fe1d2c179ea83b8da34e0000000415db3dd5c4e4589c0b7a5942f81c11548dda500600adefeb8c49d13481a88e24000000022309e4044d29f2906c728a7d19672aa7d80f3fbc289d4dd6fcab93f1e197b727000000020000001000000000000000000000000000000000000000000000000000000000000001010000000000000000000000000000000000000000000000000000000000000102000000000000000000000000000000000000000000000000000000000000010300000000000000000000000000000000000000000000000000000000000001040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000002010000000000000000000000000000000000000000000000000000000000000202000000000000000000000000000000000000000000000000000000000000020300000000000000000000000000000000000000000000000000000000000002040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000005010000000000000000000000000000000000000000000000000000000000000502000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041b024f6e2e258ac4fa7b3a0d03f9fa242eee6d884ec85d0efd4beca26a88da2100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006010202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  bytes block_2 =
    hex"000000020283622796e1a2fa4718e254eb46d3f4287b05a5aaee35af02a54f2af8362f97000000101f99db4b9ffa5ab637607ad50c7d10ea3352a53478e14354355a02b6a87a7ab1000000181ba22861f1a04d910c399ce20125a7ef53c3a47e0f51fe1d2c179ea83b8da34e0000000415db3dd5c4e4589c0b7a5942f81c11548dda500600adefeb8c49d13481a88e24000000022309e4044d29f2906c728a7d19672aa7d80f3fbc289d4dd6fcab93f1e197b72700000002013ffea42e60a3be0af304384d83ad4411df13f66213997a7f0b7551e242f19d0000002001872181b5fe2c7ea15e1e72f5672bc777d61c807771ff7ae40c9b2aa816323500000028063d7b42d552599d3f3ff8fbc93e55484d49fc20dcc41940e3ebeaac4483a8ba0000000803b6339133ac1ca21463e1e3370ca136862bac1be49bdc6e1e69f73068a22ebe0000000316204b8532027613f551ad0530dc70c1c3be36fb7828a3a6539a100c57d25034000000030000001000000000000000000000000000000000000000000000000000000000000001020000000000000000000000000000000000000000000000000000000000000103000000000000000000000000000000000000000000000000000000000000010400000000000000000000000000000000000000000000000000000000000001050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000002020000000000000000000000000000000000000000000000000000000000000203000000000000000000000000000000000000000000000000000000000000020400000000000000000000000000000000000000000000000000000000000002050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000005020000000000000000000000000000000000000000000000000000000000000503000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000042ddfdac63df2e340ea582ed2b6c9d23bf04f6e98c281c25c6dd7e87251185b3500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006020303030303030303030303030303030303030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

  bytes block_empty_1 =
    hex"000000010668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e15000000002d39729fd006096882acfbd350c91fd61883578b4fe35b63cdce3c1993a497ea000000082f8dc86ba80d8fcf491fb7a255f4163e4f9601d022ba0be35f13297531073fd80000000019c36f7bc2e4116d082865cc0b4ac8e16e9efa00ace9fb2222dd1dfd719cb671000000012b36b22912aa963f143c490227bd21e7a44338026b2f6a389cb98e82167c3718000000010668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e15000000102d39729fd006096882acfbd350c91fd61883578b4fe35b63cdce3c1993a497ea000000182f8dc86ba80d8fcf491fb7a255f4163e4f9601d022ba0be35f13297531073fd800000004238b20b7bc1d5190f8e928eb2aa2094412588f9cad6c7862f69c09a9b246d6ed0000000225d4ca531bca7d097a93bc47d7aa2c4dbcc8d0d5ecf4138849104e363eb52c0300000002000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

  bytes block_empty_2 =
    hex"000000020668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e15000000102d39729fd006096882acfbd350c91fd61883578b4fe35b63cdce3c1993a497ea000000182f8dc86ba80d8fcf491fb7a255f4163e4f9601d022ba0be35f13297531073fd800000004238b20b7bc1d5190f8e928eb2aa2094412588f9cad6c7862f69c09a9b246d6ed0000000225d4ca531bca7d097a93bc47d7aa2c4dbcc8d0d5ecf4138849104e363eb52c03000000020668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e15000000202d39729fd006096882acfbd350c91fd61883578b4fe35b63cdce3c1993a497ea000000282f8dc86ba80d8fcf491fb7a255f4163e4f9601d022ba0be35f13297531073fd800000008236394e84a01824e286653b542a923474253251e86c118f02978d5714538236c000000030aaa66ea64a4b9493d7237d092f8276e31eb3f8b14ae5c5e0a91fa5627745a8300000003000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

  function setUp() public {
    rollup = new Rollup();
    helper = new DecodeHelper();
  }

  function testEmptyBlocks() public {
    {
      bytes32 diffRoot = helper.computeDiffRoot(block_empty_1);
      assertEq(
        0x5064e7b73cbb2cf66cecd9ee874d30cc654bda2fba26ad1c75f0c9db437b261b,
        diffRoot,
        "Invalid diff root"
      );

      (
        uint256 l2BlockNumber,
        bytes32 startStateHash,
        bytes32 endStateHash,
        bytes32 publicInputsHash
      ) = helper.decode(block_empty_1);

      assertEq(l2BlockNumber, 1, "Invalid block number");
      assertEq(
        startStateHash,
        0xd3f7645c4b49d31bca62aca09aa26740d7e47d264f3021e2de2db40562944745,
        "Invalid start state hash"
      );
      assertEq(
        endStateHash,
        0x285c26b176e983e6a9101b2c9cb103771b0aedae57df63600631fed28ea7461d,
        "Invalid end state hash"
      );
      assertEq(
        publicInputsHash,
        0x2b9b56549c50cad1f6329a594979cf9a1d71f87f24c2a1bf33fe7743faabaaeb,
        "Invalid public input hash"
      );

      rollup.process(bytes(""), block_empty_1);

      assertEq(rollup.rollupStateHash(), endStateHash, "Invalid rollup state hash");
    }

    {
      bytes32 diffRoot = helper.computeDiffRoot(block_empty_2);
      assertEq(
        0x5064e7b73cbb2cf66cecd9ee874d30cc654bda2fba26ad1c75f0c9db437b261b,
        diffRoot,
        "Invalid diff root"
      );

      (
        uint256 l2BlockNumber,
        bytes32 startStateHash,
        bytes32 endStateHash,
        bytes32 publicInputsHash
      ) = helper.decode(block_empty_2);

      assertEq(l2BlockNumber, 2, "Invalid block number");
      assertEq(
        startStateHash,
        0x285c26b176e983e6a9101b2c9cb103771b0aedae57df63600631fed28ea7461d,
        "Invalid start state hash"
      );
      assertEq(
        endStateHash,
        0xa98e86cafb947da8469576e685c76b7b7451f72e8ff6c0e72c67d5bac6942b21,
        "Invalid end state hash"
      );
      assertEq(
        publicInputsHash,
        0x0fb6d019d1da49d67732e9ca797f83777f09e50777cb4d08f46865b01be85881,
        "Invalid public input hash"
      );

      rollup.process(bytes(""), block_empty_2);

      assertEq(rollup.rollupStateHash(), endStateHash, "Invalid rollup state hash");
    }
  }

  function testNonEmptyBlocks() public {
    {
      bytes32 diffRoot = helper.computeDiffRoot(block_1);
      assertEq(
        0x9f1a00d7220a2b51a9c2591c2f85e089f03d06b01138586ea5e3656435d5e749,
        diffRoot,
        "Invalid diff root block 1"
      );

      (
        uint256 l2BlockNumber,
        bytes32 startStateHash,
        bytes32 endStateHash,
        bytes32 publicInputsHash
      ) = helper.decode(block_1);

      assertEq(l2BlockNumber, 1, "Invalid block number");
      assertEq(
        startStateHash,
        0xd3f7645c4b49d31bca62aca09aa26740d7e47d264f3021e2de2db40562944745,
        "Invalid start state hash block 1"
      );
      assertEq(
        endStateHash,
        0xe3b20add23469bcbf25157ff75b81665564b089aa95083f8e095a3bb77062831,
        "Invalid end state hash block 1"
      );
      assertEq(
        publicInputsHash,
        0x20638cd5e03d287dbd356af6e16fd852337f535b12d06f7266599c035696098d,
        "Invalid public input hash block 1"
      );

      rollup.process(bytes(""), block_1);

      assertEq(rollup.rollupStateHash(), endStateHash, "Invalid rollup state hash block 1");
    }

    {
      bytes32 diffRoot = helper.computeDiffRoot(block_2);
      assertEq(
        0x50f2f2dc986fc4022b8fdde8f2d610c82ee36776b282ca3514c12726dd9081ef,
        diffRoot,
        "Invalid diff root block 2"
      );

      (
        uint256 l2BlockNumber,
        bytes32 startStateHash,
        bytes32 endStateHash,
        bytes32 publicInputsHash
      ) = helper.decode(block_2);

      assertEq(l2BlockNumber, 2, "Invalid block number");
      assertEq(
        startStateHash,
        0xe3b20add23469bcbf25157ff75b81665564b089aa95083f8e095a3bb77062831,
        "Invalid start state hash block 2"
      );
      assertEq(
        endStateHash,
        0xdc4f85374d479c6388a9bed0ddea9880422b515c88de0a76fd96b5c93c809b21,
        "Invalid end state hash block 2"
      );
      assertEq(
        publicInputsHash,
        0x12e84ea31aa75fab86269181c8c09dbb8486e518e5db9ce4dad204068fc0a925,
        "Invalid public input hash block 2"
      );

      rollup.process(bytes(""), block_2);

      assertEq(rollup.rollupStateHash(), endStateHash, "Invalid rollup state hash");
    }
  }
}
