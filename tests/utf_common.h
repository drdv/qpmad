/**
    @file
    @author  Alexander Sherikov

    @copyright 2017 Alexander Sherikov. Licensed under the Apache License,
    Version 2.0. (see LICENSE or http://www.apache.org/licenses/LICENSE-2.0)

    @brief
*/

#define BOOST_TEST_MODULE qpmad
#define BOOST_TEST_DYN_LINK
#include <boost/test/unit_test.hpp>
#include <boost/timer/timer.hpp>
#include <boost/lexical_cast.hpp>

#include <iostream>

#include <Eigen/Dense>


const double g_default_tolerance = 1e-12;
const double g_infinity = 1e+20;


struct GlobalFixtureConfig
{
    GlobalFixtureConfig()
    {
        boost::unit_test::unit_test_log.set_threshold_level( boost::unit_test::log_successful_tests );
    }
    ~GlobalFixtureConfig() {}
};


inline void getRandomPositiveDefinititeMatrix(Eigen::MatrixXd &M, const std::size_t size)
{
    M.setRandom(size, size);
    M = M.transpose()*M + Eigen::MatrixXd::Identity(size, size);
}


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
// Depending on Boost version a compiler may issue a warning about extra ';',
// at the same time, compilation may fail on some systems if ';' is omitted.
BOOST_GLOBAL_FIXTURE( GlobalFixtureConfig ) ;
#pragma GCC diagnostic pop

