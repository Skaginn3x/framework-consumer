#include <iostream>
#include <tfc/ipc.hpp>
#include <tfc/confman.hpp>
#include <tfc/logger.hpp>
#include <tfc/progbase.hpp>
#include <boost/asio.hpp>
#include <glaze/glaze.hpp>

namespace asio = boost::asio;

struct storage {
  int a{};
  double b{};
  struct glaze {
    static auto constexpr value{glz::object("a_key", &storage::a, "b_key", &storage::b)};
    static auto constexpr name{"app_storage"}; // used for json schema
  };
};

class App {
public:
  App(asio::io_context &ctx) :
          bool_slot_{ctx, "slot_name", []([[maybe_unused]] bool new_state) {
              fmt::print("{}\n", new_state);
          }},
          json_signal_{ctx, "signal_name"},
          config_{ctx, "app"},
          logger_{"app"} {}


private:
  tfc::ipc::bool_slot bool_slot_;
  tfc::ipc::json_signal json_signal_;
  tfc::confman::config<storage> config_;
  tfc::logger::logger logger_;
};


int main(int argc, char **argv) {
  tfc::base::init(argc, argv);

  asio::io_context ctx;

  [[maybe_unused]] auto const app{ App(ctx) };

  asio::co_spawn(ctx, tfc::base::exit_signals(ctx), asio::detached);

  ctx.run();

  return EXIT_SUCCESS;
}
