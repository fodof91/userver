#pragma once

#include <array>
#include <atomic>
#include <cstddef>
#include <cstdint>
#include <unordered_map>

#include <userver/utils/statistics/fwd.hpp>

USERVER_NAMESPACE_BEGIN

namespace utils::statistics {

class HttpCodes final {
 public:
  using Code = int;
  using Counter = std::uint64_t;

  struct Snapshot final {
    void Add(const Snapshot& other);

    std::unordered_map<Code, Counter> codes;
  };

  HttpCodes();

  void Account(Code code) noexcept;

  Snapshot GetSnapshot() const;

 private:
  using ValueType = std::uint64_t;

  static constexpr Code kMinHttpStatus = 100;
  static constexpr Code kMaxHttpStatus = 600;
  std::array<std::atomic<ValueType>, kMaxHttpStatus - kMinHttpStatus> codes_{};
};

void DumpMetric(Writer& writer, const HttpCodes::Snapshot& snapshot);

}  // namespace utils::statistics

USERVER_NAMESPACE_END
